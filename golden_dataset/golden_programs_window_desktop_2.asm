; DESCRIPTION: This GeOS assembly code implements a multi-window desktop environment with three windows titled "Hello," "Counter," and "Colors." It demonstrates the integration of window management (WINSYS) and mouse input (MOUSEQ) systems, allowing users to drag windows by clicking on their title bars, focus on them by clicking elsewhere, and quit the application by pressing 'Q'. Each window has its own content rendering logic: a green background with "Hello," a blue background with an animated counter bar, and a continuously changing color stripe pattern. The code also includes a main loop that handles mouse movement for dragging windows and updates the window contents at specific intervals to create animations.

; window_desktop.asm -- Multi-window desktop demo (Phase 68b)
; Demonstrates WINSYS + MOUSEQ integration: drag, focus, multiple windows.
; Each window draws its own content into its offscreen buffer.
;
; Controls: Move mouse to interact. Click title bar to drag, click body to focus.
; Press Q to quit.

; ── Constants ──
LDI r14, 1
LDI r20, 0         ; zero constant

; ── Store title strings in RAM ──
LDI r7, 0x2000
STRO r7, "Hello"
LDI r7, 0x2020
STRO r7, "Counter"
LDI r7, 0x2040
STRO r7, "Colors"

; ── Create 3 windows ──

; Window 1: "Hello" at (20, 20), 100x80
LDI r10, 20
LDI r1, 20
LDI r3, 100
LDI r15, 80
LDI r5, 0x2000     ; title addr
LDI r7, 0          ; op=0 (create)
WINSYS r7
MOV r9, r2        ; r9 = win1_id

; Window 2: "Counter" at (140, 30), 100x80
LDI r10, 140
LDI r1, 30
LDI r3, 100
LDI r15, 80
LDI r5, 0x2020
LDI r7, 0
WINSYS r7
MOV r13, r2        ; r13 = win2_id

; Window 3: "Colors" at (60, 120), 100x80
LDI r10, 60
LDI r1, 120
LDI r3, 100
LDI r15, 80
LDI r5, 0x2040
LDI r7, 0
WINSYS r7
MOV r12, r2        ; r12 = win3_id

; ── Draw window contents ──

; Window 1: Green background with welcome text
CALL draw_win1

; Window 2: Blue background with counter
CALL draw_win2

; Window 3: Color stripes
CALL draw_win3

; ── Drag state ──
; r0 = dragging window id (0 = none)
; r16 = drag offset X
; r17 = drag offset Y
LDI r0, 0
LDI r16, 0
LDI r17, 0

; ── Counter for window 2 ──
LDI r18, 0         ; counter value

; ── Main loop ──
main_loop:
  FILL r20          ; clear screen to black

  ; Read mouse state: r21=mx, r22=my, r23=btn
  MOUSEQ r21

  ; Read keyboard
  IKEY r24
  LDI r25, 81       ; 'Q'
  CMP r24, r25
  JZ r2, quit

  ; ── Handle mouse button ──
  LDI r25, 2
  CMP r23, r25      ; click?
  BGE r2, check_drag

  ; Fresh click -- do hittest
  LDI r7, 4         ; op=4 (hittest)
  WINSYS r7         ; r2=win_id, r10=hit_type

  ; If no hit, skip
  JZ r2, no_click_action

  ; Bring clicked window to front
  LDI r7, 2         ; op=2 (bring to front)
  WINSYS r7

  ; Check hit type -- title bar = start drag
  LDI r25, 1
  CMP r10, r25       ; r10 = hit_type from hittest
  JNZ r2, no_click_action

  ; Start dragging (title bar hit)
  MOV r0, r2       ; r0 = dragging win_id

  ; Get window info for drag offset
  MOV r2, r0
  LDI r10, 0x9000    ; winfo dest addr
  LDI r7, 6         ; op=6 (winfo)
  WINSYS r7

  ; drag_ox = mouse_x - win_x
  LOAD r25, 0x9000  ; win_x
  MOV r26, r21
  SUB r26, r25      ; mx - win_x
  MOV r16, r26

  ; drag_oy = mouse_y - win_y
  LOAD r25, 0x9001  ; win_y
  MOV r26, r22
  SUB r26, r25      ; my - win_y
  MOV r17, r26

  JMP no_click_action

check_drag:
  ; If not dragging, skip
  JZ r0, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r2, r0       ; win_id
  MOV r10, r21
  SUB r10, r16       ; new_x = mx - drag_ox
  MOV r1, r22
  SUB r1, r17       ; new_y = my - drag_oy
  LDI r7, 5         ; op=5 (moveto)
  WINSYS r7

  JMP no_click_action

stop_drag:
  LDI r0, 0        ; stop dragging
  JMP no_click_action

no_click_action:

  ; ── Update counter (throttled to ~2/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 31
  AND r26, r27      ; TICKS & 31
  JNZ r26, skip_counter
  ADD r18, r14       ; counter++
  CALL draw_win2    ; redraw with new counter
skip_counter:

  ; ── Animate colors window (~4/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25
  LDI r27, 15
  AND r26, r27
  JNZ r26, skip_colors
  CALL draw_win3
skip_colors:

  ; ── Draw window borders and title bars on screen ──
  ; Window 1 border
  MOV r2, r9
  CALL draw_window_frame

  ; Window 2 border
  MOV r2, r13
  CALL draw_window_frame

  ; Window 3 border
  MOV r2, r12
  CALL draw_window_frame

  FRAME
  JMP main_loop

quit:
  HALT

; ── Draw Window 1: Green background ──
draw_win1:
  PUSH r31
  PUSH r2
  MOV r2, r9       ; win_id

  ; Fill with dark green
  LDI r3, 0x003300  ; dark green
  LDI r15, 0         ; y
fill1_loop:
  LDI r7, 0         ; x
fill1_x:
  WPIXEL r2, r7, r15, r3
  ADD r7, r14        ; x++
  LDI r25, 100
  CMP r7, r25
  BLT r2, fill1_x
  ADD r15, r14        ; y++
  LDI r25, 80
  CMP r15, r25
  BLT r2, fill1_loop

  ; Draw a bright green H in the center
  LDI r3, 0x00FF00  ; bright green
  ; Left vertical of H
  LDI r15, 30
  LDI r7, 40
h_left:
  WPIXEL r2, r7, r15, r3
  WPIXEL r2, r7, r15, r3
  ADD r15, r14
  LDI r25, 60
  CMP r15, r25
  BLT r2, h_left

  ; Right vertical of H
  LDI r15, 30
  LDI r7, 48
h_right:
  WPIXEL r2, r7, r15, r3
  ADD r15, r14
  LDI r25, 60
  CMP r15, r25
  BLT r2, h_right

  ; Crossbar of H
  LDI r15, 44
  LDI r7, 40
h_bar:
  WPIXEL r2, r7, r15, r3
  ADD r7, r14
  LDI r25, 49
  CMP r7, r25
  BLT r2, h_bar

  POP r2
  POP r31
  RET

; ── Draw Window 2: Blue background with counter bar ──
draw_win2:
  PUSH r31
  PUSH r2

  MOV r2, r13       ; win_id

  ; Fill with dark blue
  LDI r3, 0x000033  ; dark blue
  LDI r15, 0
fill2_loop:
  LDI r7, 0
fill2_x:
  WPIXEL r2, r7, r15, r3
  ADD r7, r14
  LDI r25, 100
  CMP r7, r25
  BLT r2, fill2_x
  ADD r15, r14
  LDI r25, 80
  CMP r15, r25
  BLT r2, fill2_loop

  ; Draw counter bar (white bar, length = counter % 90 + 5)
  LDI r3, 0xFFFFFF  ; white
  LDI r15, 40        ; y position
  MOV r5, r18
  LDI r25, 90
  MOD r5, r25
  ADD r5, r14        ; +1 = at least 1 pixel
  LDI r7, 5         ; x offset
bar_loop:
  CMP r7, r5
  BGE r2, bar_done
  WPIXEL r2, r7, r15, r3
  ADD r7, r14
  JMP bar_loop
bar_done:

  POP r2
  POP r31
  RET

; ── Draw Window 3: Animated color stripes ──
draw_win3:
  PUSH r31
  PUSH r2
  PUSH r10
  PUSH r1

  MOV r2, r12       ; win_id

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r15, 0         ; y
stripe_y:
  LDI r7, 0         ; x
stripe_x:
  ; Color from position + time
  MOV r10, r7
  ADD r10, r26       ; x + ticks
  LDI r25, 31
  AND r10, r25       ; (x + ticks) & 31
  LDI r25, 3
  MUL r10, r25       ; 0-93
  LDI r25, 8
  SHL r10, r25       ; shift into green channel
  MOV r3, r15
  LDI r1, 7
  AND r3, r1        ; y & 7
  LDI r25, 16
  SHL r3, r25       ; red channel
  OR r10, r3         ; combine
  MOV r3, r10

  WPIXEL r2, r7, r15, r3
  ADD r7, r14        ; x++
  LDI r25, 100
  CMP r7, r25
  BLT r2, stripe_x

  ADD r15, r14        ; y++
  LDI r25, 80
  CMP r15, r25
  BLT r2, stripe_y

  POP r1
  POP r10
  POP r2
  POP r31
  RET

; ── Draw window frame (title bar + border) on screen ──
; r2 = win_id
draw_window_frame:
  PUSH r31
  PUSH r2
  PUSH r10
  PUSH r1
  PUSH r3
  PUSH r15
  PUSH r5
  PUSH r7

  ; Get window info
  MOV r2, r2
  LDI r10, 0x9200    ; winfo addr
  LDI r7, 6         ; WINFO
  WINSYS r7
  JZ r2, frame_done  ; window not found

  LOAD r1, 0x9200   ; win_x
  LOAD r3, 0x9201   ; win_y
  LOAD r15, 0x9202   ; win_w
  LOAD r5, 0x9203   ; win_h

  ; Title bar (12px tall, purple)
  LDI r10, 0x444488
  MOV r7, r3         ; y = win_y
title_y:
  MOV r2, r1         ; x = win_x
title_x:
  PSET r2, r7, r10
  ADD r2, r14
  MOV r25, r1
  ADD r25, r15        ; x limit
  CMP r2, r25
  BLT r2, title_x
  ADD r7, r14
  LDI r25, 12
  ADD r25, r3        ; y limit (win_y + 12)
  CMP r7, r25
  BLT r2, title_y

  ; Border outline (gray)
  LDI r10, 0x888888
  ; Left + right edges
  MOV r2, r3         ; y = win_y
border_y:
  PSET r1, r2, r10    ; left edge
  MOV r25, r1
  ADD r25, r15
  SUB r25, r14        ; right edge x
  PSET r25, r2, r10
  ADD r2, r14
  MOV r25, r3
  ADD r25, r5
  CMP r2, r25
  BLT r2, border_y

  ; Bottom edge
  MOV r2, r3
  ADD r2, r5
  SUB r2, r14         ; bottom y
  MOV r7, r1         ; x = win_x
bottom_x:
  PSET r7, r2, r10
  ADD r7, r14
  MOV r25, r1
  ADD r25, r15
  CMP r7, r25
  BLT r2, bottom_x

frame_done:
  POP r7
  POP r5
  POP r15
  POP r3
  POP r1
  POP r10
  POP r2
  POP r31
  RET
