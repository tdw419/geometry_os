; DESCRIPTION: This GeOS assembly code implements a multi-window desktop environment with three windows titled "Hello," "Counter," and "Colors." It demonstrates the integration of window management (WINSYS) and mouse input (MOUSEQ) systems, allowing users to drag windows by clicking on their title bars, focus on them by clicking elsewhere, and quit the application by pressing 'Q'. Each window has its own content rendering logic: a green background with "Hello," a blue background with an animated counter bar, and a continuously changing color stripe pattern. The code also includes a main loop that handles mouse movement for dragging windows and updates the window contents at specific intervals to create animations.

; window_desktop.asm -- Multi-window desktop demo (Phase 68b)
; Demonstrates WINSYS + MOUSEQ integration: drag, focus, multiple windows.
; Each window draws its own content into its offscreen buffer.
;
; Controls: Move mouse to interact. Click title bar to drag, click body to focus.
; Press Q to quit.

; ── Constants ──
LDI r11, 1
LDI r20, 0         ; zero constant

; ── Store title strings in RAM ──
LDI r2, 0x2000
STRO r2, "Hello"
LDI r2, 0x2020
STRO r2, "Counter"
LDI r2, 0x2040
STRO r2, "Colors"

; ── Create 3 windows ──

; Window 1: "Hello" at (20, 20), 100x80
LDI r10, 20
LDI r9, 20
LDI r13, 100
LDI r4, 80
LDI r7, 0x2000     ; title addr
LDI r2, 0          ; op=0 (create)
WINSYS r2
MOV r1, r5        ; r1 = win1_id

; Window 2: "Counter" at (140, 30), 100x80
LDI r10, 140
LDI r9, 30
LDI r13, 100
LDI r4, 80
LDI r7, 0x2020
LDI r2, 0
WINSYS r2
MOV r0, r5        ; r0 = win2_id

; Window 3: "Colors" at (60, 120), 100x80
LDI r10, 60
LDI r9, 120
LDI r13, 100
LDI r4, 80
LDI r7, 0x2040
LDI r2, 0
WINSYS r2
MOV r3, r5        ; r3 = win3_id

; ── Draw window contents ──

; Window 1: Green background with welcome text
CALL draw_win1

; Window 2: Blue background with counter
CALL draw_win2

; Window 3: Color stripes
CALL draw_win3

; ── Drag state ──
; r15 = dragging window id (0 = none)
; r16 = drag offset X
; r17 = drag offset Y
LDI r15, 0
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
  JZ r5, quit

  ; ── Handle mouse button ──
  LDI r25, 2
  CMP r23, r25      ; click?
  BGE r5, check_drag

  ; Fresh click -- do hittest
  LDI r2, 4         ; op=4 (hittest)
  WINSYS r2         ; r5=win_id, r10=hit_type

  ; If no hit, skip
  JZ r5, no_click_action

  ; Bring clicked window to front
  LDI r2, 2         ; op=2 (bring to front)
  WINSYS r2

  ; Check hit type -- title bar = start drag
  LDI r25, 1
  CMP r10, r25       ; r10 = hit_type from hittest
  JNZ r5, no_click_action

  ; Start dragging (title bar hit)
  MOV r15, r5       ; r15 = dragging win_id

  ; Get window info for drag offset
  MOV r5, r15
  LDI r10, 0x9000    ; winfo dest addr
  LDI r2, 6         ; op=6 (winfo)
  WINSYS r2

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
  JZ r15, no_click_action

  ; If button released (btn=0), stop dragging
  JZ r23, stop_drag

  ; Still dragging -- move window to mouse position
  MOV r5, r15       ; win_id
  MOV r10, r21
  SUB r10, r16       ; new_x = mx - drag_ox
  MOV r9, r22
  SUB r9, r17       ; new_y = my - drag_oy
  LDI r2, 5         ; op=5 (moveto)
  WINSYS r2

  JMP no_click_action

stop_drag:
  LDI r15, 0        ; stop dragging
  JMP no_click_action

no_click_action:

  ; ── Update counter (throttled to ~2/sec) ──
  LDI r25, 0xFFE
  LOAD r26, r25     ; TICKS
  LDI r27, 31
  AND r26, r27      ; TICKS & 31
  JNZ r26, skip_counter
  ADD r18, r11       ; counter++
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
  MOV r5, r1
  CALL draw_window_frame

  ; Window 2 border
  MOV r5, r0
  CALL draw_window_frame

  ; Window 3 border
  MOV r5, r3
  CALL draw_window_frame

  FRAME
  JMP main_loop

quit:
  HALT

; ── Draw Window 1: Green background ──
draw_win1:
  PUSH r31
  PUSH r5
  MOV r5, r1       ; win_id

  ; Fill with dark green
  LDI r13, 0x003300  ; dark green
  LDI r4, 0         ; y
fill1_loop:
  LDI r2, 0         ; x
fill1_x:
  WPIXEL r5, r2, r4, r13
  ADD r2, r11        ; x++
  LDI r25, 100
  CMP r2, r25
  BLT r5, fill1_x
  ADD r4, r11        ; y++
  LDI r25, 80
  CMP r4, r25
  BLT r5, fill1_loop

  ; Draw a bright green H in the center
  LDI r13, 0x00FF00  ; bright green
  ; Left vertical of H
  LDI r4, 30
  LDI r2, 40
h_left:
  WPIXEL r5, r2, r4, r13
  WPIXEL r5, r2, r4, r13
  ADD r4, r11
  LDI r25, 60
  CMP r4, r25
  BLT r5, h_left

  ; Right vertical of H
  LDI r4, 30
  LDI r2, 48
h_right:
  WPIXEL r5, r2, r4, r13
  ADD r4, r11
  LDI r25, 60
  CMP r4, r25
  BLT r5, h_right

  ; Crossbar of H
  LDI r4, 44
  LDI r2, 40
h_bar:
  WPIXEL r5, r2, r4, r13
  ADD r2, r11
  LDI r25, 49
  CMP r2, r25
  BLT r5, h_bar

  POP r5
  POP r31
  RET

; ── Draw Window 2: Blue background with counter bar ──
draw_win2:
  PUSH r31
  PUSH r5

  MOV r5, r0       ; win_id

  ; Fill with dark blue
  LDI r13, 0x000033  ; dark blue
  LDI r4, 0
fill2_loop:
  LDI r2, 0
fill2_x:
  WPIXEL r5, r2, r4, r13
  ADD r2, r11
  LDI r25, 100
  CMP r2, r25
  BLT r5, fill2_x
  ADD r4, r11
  LDI r25, 80
  CMP r4, r25
  BLT r5, fill2_loop

  ; Draw counter bar (white bar, length = counter % 90 + 5)
  LDI r13, 0xFFFFFF  ; white
  LDI r4, 40        ; y position
  MOV r7, r18
  LDI r25, 90
  MOD r7, r25
  ADD r7, r11        ; +1 = at least 1 pixel
  LDI r2, 5         ; x offset
bar_loop:
  CMP r2, r7
  BGE r5, bar_done
  WPIXEL r5, r2, r4, r13
  ADD r2, r11
  JMP bar_loop
bar_done:

  POP r5
  POP r31
  RET

; ── Draw Window 3: Animated color stripes ──
draw_win3:
  PUSH r31
  PUSH r5
  PUSH r10
  PUSH r9

  MOV r5, r3       ; win_id

  ; Get ticks for animation
  LDI r25, 0xFFE
  LOAD r26, r25     ; ticks

  ; Fill with animated stripes
  LDI r4, 0         ; y
stripe_y:
  LDI r2, 0         ; x
stripe_x:
  ; Color from position + time
  MOV r10, r2
  ADD r10, r26       ; x + ticks
  LDI r25, 31
  AND r10, r25       ; (x + ticks) & 31
  LDI r25, 3
  MUL r10, r25       ; 0-93
  LDI r25, 8
  SHL r10, r25       ; shift into green channel
  MOV r13, r4
  LDI r9, 7
  AND r13, r9        ; y & 7
  LDI r25, 16
  SHL r13, r25       ; red channel
  OR r10, r13         ; combine
  MOV r13, r10

  WPIXEL r5, r2, r4, r13
  ADD r2, r11        ; x++
  LDI r25, 100
  CMP r2, r25
  BLT r5, stripe_x

  ADD r4, r11        ; y++
  LDI r25, 80
  CMP r4, r25
  BLT r5, stripe_y

  POP r9
  POP r10
  POP r5
  POP r31
  RET

; ── Draw window frame (title bar + border) on screen ──
; r5 = win_id
draw_window_frame:
  PUSH r31
  PUSH r5
  PUSH r10
  PUSH r9
  PUSH r13
  PUSH r4
  PUSH r7
  PUSH r2

  ; Get window info
  MOV r5, r5
  LDI r10, 0x9200    ; winfo addr
  LDI r2, 6         ; WINFO
  WINSYS r2
  JZ r5, frame_done  ; window not found

  LOAD r9, 0x9200   ; win_x
  LOAD r13, 0x9201   ; win_y
  LOAD r4, 0x9202   ; win_w
  LOAD r7, 0x9203   ; win_h

  ; Title bar (12px tall, purple)
  LDI r10, 0x444488
  MOV r2, r13         ; y = win_y
title_y:
  MOV r5, r9         ; x = win_x
title_x:
  PSET r5, r2, r10
  ADD r5, r11
  MOV r25, r9
  ADD r25, r4        ; x limit
  CMP r5, r25
  BLT r5, title_x
  ADD r2, r11
  LDI r25, 12
  ADD r25, r13        ; y limit (win_y + 12)
  CMP r2, r25
  BLT r5, title_y

  ; Border outline (gray)
  LDI r10, 0x888888
  ; Left + right edges
  MOV r5, r13         ; y = win_y
border_y:
  PSET r9, r5, r10    ; left edge
  MOV r25, r9
  ADD r25, r4
  SUB r25, r11        ; right edge x
  PSET r25, r5, r10
  ADD r5, r11
  MOV r25, r13
  ADD r25, r7
  CMP r5, r25
  BLT r5, border_y

  ; Bottom edge
  MOV r5, r13
  ADD r5, r7
  SUB r5, r11         ; bottom y
  MOV r2, r9         ; x = win_x
bottom_x:
  PSET r2, r5, r10
  ADD r2, r11
  MOV r25, r9
  ADD r25, r4
  CMP r2, r25
  BLT r5, bottom_x

frame_done:
  POP r2
  POP r7
  POP r4
  POP r13
  POP r9
  POP r10
  POP r5
  POP r31
  RET
