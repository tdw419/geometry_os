; DESCRIPTION: This GeOS assembly code implements a multi-window desktop environment with three windows titled "Hello," "Counter," and "Colors." It demonstrates the integration of window management (WINSYS) and mouse input (MOUSEQ) systems, allowing users to drag windows by clicking on their title bars, focus on them by clicking elsewhere, and quit the application by pressing 'Q'. Each window has its own content rendering logic: a green background with "Hello," a blue background with an animated counter bar, and a continuously changing color stripe pattern. The code also includes a main loop that handles mouse movement for dragging windows and updates the window contents at specific intervals to create animations.

; window_desktop.asm -- Multi-window desktop demo (Phase 68b)
; Demonstrates WINSYS + MOUSEQ integration: drag, focus, multiple windows.
; Each window draws its own content into its offscreen buffer.
;
; Controls: Move mouse to interact. Click title bar to drag, click body to focus.
; Press Q to quit.

; ── Constants ──
LDI r4, 1
LDI r20, 0         ; zero constant

; ── Store title strings in RAM ──
LDI r11, 0x2000
STRO r11, "Hello"
LDI r11, 0x2020
STRO r11, "Counter"
LDI r11, 0x2040
STRO r11, "Colors"

; ── Create 3 windows ──

; Window 1: "Hello" at (20, 20), 100x80
LDI r0, 20
LDI r1, 20
LDI r8, 100
LDI r13, 80
LDI r6, 0x2000     ; title addr
LDI r11, 0          ; op=0 (create)
WINSYS r11
MOV r14, r12        ; r14 = win1_id

; Window 2: "Counter" at (140, 30), 100x80
LDI r0, 140
LDI r1, 30
LDI r8, 100
LDI r13, 80
LDI r6, 0x2020
LDI r11, 0
WINSYS r11
MOV r5, r12        ; r5 = win2_id

; Window 3: "Colors" at (60, 120), 100x80
LDI r0, 60
LDI r1, 120
LDI r8, 100
LDI r13, 80
LDI r6, 0x2040
LDI r11, 0
WINSYS r11
MOV r3, r12        ; r3 = win3_id

; ── Draw window contents ──

; Window 1: Green background with welcome text
CALL draw_win1

; Window 2: Blue background with counter
CALL draw_win2

; Window 3: Color stripes
CALL draw_win3

; ── Drag state ──
; r10 = dragging window id (0 = none)
; r16 = drag offset X
; r17 = drag offset Y
LDI r10, 0
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
  JZ r12, quit

  ; ── Handle mouse button ──
  LDI r25, 2
  CMP r23, r25      ; click?
  BGE r12, check_drag

  ; Fresh click -- do hittest
  LDI r11, 4         ; op=4 (hittest)
  WINSYS r11         ; r12=win_id, r0=hit_type

  ; If no hit, skip
  JZ r12, no_click_action

  ; Bring clicked window to front
  LDI r11, 2         ; op=2 (bring to front)
  WINSYS r11

  ; Check hit type -- title bar = start drag
  LDI r25, 1
  CMP r0, r25       ; r0 = hit_type from hittest
  JNZ r12, no_click_action

  ; Start dragging (title bar hit)
  MOV r10, r12       ; r10 = dragging win_id

  ; Get window info for drag offset
  MOV r12, r10
  LDI r0, 0x9000    ; winfo dest addr
  LDI r11, 6         ; op=6 (winfo)
  WINSYS r11

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
  JZ r10, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r12, r10       ; win_id
  MOV r0, r21
  SUB r0, r16       ; new_x = mx - drag_ox
  MOV r1, r22
  SUB r1, r17       ; new_y = my - drag_oy
  LDI r11, 5         ; op=5 (moveto)
  WINSYS r11

  JMP no_click_action

stop_drag:
  LDI r10, 0        ; stop dragging
  JMP no_click_action

no_click_action:

  ; ── Update counter (throttled to ~2/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 31
  AND r26, r27      ; TICKS & 31
  JNZ r26, skip_counter
  ADD r18, r4       ; counter++
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
  MOV r12, r14
  CALL draw_window_frame

  ; Window 2 border
  MOV r12, r5
  CALL draw_window_frame

  ; Window 3 border
  MOV r12, r3
  CALL draw_window_frame

  FRAME
  JMP main_loop

quit:
  HALT

; ── Draw Window 1: Green background ──
draw_win1:
  PUSH r31
  PUSH r12
  MOV r12, r14       ; win_id

  ; Fill with dark green
  LDI r8, 0x003300  ; dark green
  LDI r13, 0         ; y
fill1_loop:
  LDI r11, 0         ; x
fill1_x:
  WPIXEL r12, r11, r13, r8
  ADD r11, r4        ; x++
  LDI r25, 100
  CMP r11, r25
  BLT r12, fill1_x
  ADD r13, r4        ; y++
  LDI r25, 80
  CMP r13, r25
  BLT r12, fill1_loop

  ; Draw a bright green H in the center
  LDI r8, 0x00FF00  ; bright green
  ; Left vertical of H
  LDI r13, 30
  LDI r11, 40
h_left:
  WPIXEL r12, r11, r13, r8
  WPIXEL r12, r11, r13, r8
  ADD r13, r4
  LDI r25, 60
  CMP r13, r25
  BLT r12, h_left

  ; Right vertical of H
  LDI r13, 30
  LDI r11, 48
h_right:
  WPIXEL r12, r11, r13, r8
  ADD r13, r4
  LDI r25, 60
  CMP r13, r25
  BLT r12, h_right

  ; Crossbar of H
  LDI r13, 44
  LDI r11, 40
h_bar:
  WPIXEL r12, r11, r13, r8
  ADD r11, r4
  LDI r25, 49
  CMP r11, r25
  BLT r12, h_bar

  POP r12
  POP r31
  RET

; ── Draw Window 2: Blue background with counter bar ──
draw_win2:
  PUSH r31
  PUSH r12

  MOV r12, r5       ; win_id

  ; Fill with dark blue
  LDI r8, 0x000033  ; dark blue
  LDI r13, 0
fill2_loop:
  LDI r11, 0
fill2_x:
  WPIXEL r12, r11, r13, r8
  ADD r11, r4
  LDI r25, 100
  CMP r11, r25
  BLT r12, fill2_x
  ADD r13, r4
  LDI r25, 80
  CMP r13, r25
  BLT r12, fill2_loop

  ; Draw counter bar (white bar, length = counter % 90 + 5)
  LDI r8, 0xFFFFFF  ; white
  LDI r13, 40        ; y position
  MOV r6, r18
  LDI r25, 90
  MOD r6, r25
  ADD r6, r4        ; +1 = at least 1 pixel
  LDI r11, 5         ; x offset
bar_loop:
  CMP r11, r6
  BGE r12, bar_done
  WPIXEL r12, r11, r13, r8
  ADD r11, r4
  JMP bar_loop
bar_done:

  POP r12
  POP r31
  RET

; ── Draw Window 3: Animated color stripes ──
draw_win3:
  PUSH r31
  PUSH r12
  PUSH r0
  PUSH r1

  MOV r12, r3       ; win_id

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r13, 0         ; y
stripe_y:
  LDI r11, 0         ; x
stripe_x:
  ; Color from position + time
  MOV r0, r11
  ADD r0, r26       ; x + ticks
  LDI r25, 31
  AND r0, r25       ; (x + ticks) & 31
  LDI r25, 3
  MUL r0, r25       ; 0-93
  LDI r25, 8
  SHL r0, r25       ; shift into green channel
  MOV r8, r13
  LDI r1, 7
  AND r8, r1        ; y & 7
  LDI r25, 16
  SHL r8, r25       ; red channel
  OR r0, r8         ; combine
  MOV r8, r0

  WPIXEL r12, r11, r13, r8
  ADD r11, r4        ; x++
  LDI r25, 100
  CMP r11, r25
  BLT r12, stripe_x

  ADD r13, r4        ; y++
  LDI r25, 80
  CMP r13, r25
  BLT r12, stripe_y

  POP r1
  POP r0
  POP r12
  POP r31
  RET

; ── Draw window frame (title bar + border) on screen ──
; r12 = win_id
draw_window_frame:
  PUSH r31
  PUSH r12
  PUSH r0
  PUSH r1
  PUSH r8
  PUSH r13
  PUSH r6
  PUSH r11

  ; Get window info
  MOV r12, r12
  LDI r0, 0x9200    ; winfo addr
  LDI r11, 6         ; WINFO
  WINSYS r11
  JZ r12, frame_done  ; window not found

  LOAD r1, 0x9200   ; win_x
  LOAD r8, 0x9201   ; win_y
  LOAD r13, 0x9202   ; win_w
  LOAD r6, 0x9203   ; win_h

  ; Title bar (12px tall, purple)
  LDI r0, 0x444488
  MOV r11, r8         ; y = win_y
title_y:
  MOV r12, r1         ; x = win_x
title_x:
  PSET r12, r11, r0
  ADD r12, r4
  MOV r25, r1
  ADD r25, r13        ; x limit
  CMP r12, r25
  BLT r12, title_x
  ADD r11, r4
  LDI r25, 12
  ADD r25, r8        ; y limit (win_y + 12)
  CMP r11, r25
  BLT r12, title_y

  ; Border outline (gray)
  LDI r0, 0x888888
  ; Left + right edges
  MOV r12, r8         ; y = win_y
border_y:
  PSET r1, r12, r0    ; left edge
  MOV r25, r1
  ADD r25, r13
  SUB r25, r4        ; right edge x
  PSET r25, r12, r0
  ADD r12, r4
  MOV r25, r8
  ADD r25, r6
  CMP r12, r25
  BLT r12, border_y

  ; Bottom edge
  MOV r12, r8
  ADD r12, r6
  SUB r12, r4         ; bottom y
  MOV r11, r1         ; x = win_x
bottom_x:
  PSET r11, r12, r0
  ADD r11, r4
  MOV r25, r1
  ADD r25, r13
  CMP r11, r25
  BLT r12, bottom_x

frame_done:
  POP r11
  POP r6
  POP r13
  POP r8
  POP r1
  POP r0
  POP r12
  POP r31
  RET
