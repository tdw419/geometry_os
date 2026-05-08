; DESCRIPTION: Draw object: pos=the screen, color=colored, size=fixed size.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r14, 1         ; mode = start recording
  SNAP_TRACE r14      ; begin trace recording

  LDI r13, 0         ; frame counter
  LDI r15, 16        ; total frames to draw
  LDI r0, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r2, 0
  FILL r2

  ; Draw a vertical bar at position r0
  LDI r11, 0          ; y = 0
  LDI r5, 256        ; y limit
  LDI r6, 0x00FF00   ; green bar color
  LDI r8, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r0, r11)
  LDI r7, 0
bar_x:
  LDI r12, 0
  ADD r12, r0
  ADD r12, r7         ; x = bar_pos + offset
  SCREENP r12, r11, r6    ; set pixel
  LDI r1, 1
  ADD r7, r1
  CMP r7, r8
  BLT r9, bar_x

  LDI r1, 1
  ADD r11, r1
  CMP r11, r5
  BLT r9, bar_y

  ; Advance bar position
  LDI r1, 16
  ADD r0, r1

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r1, 1
  ADD r13, r1
  CMP r13, r15
  BLT r9, draw_loop

  ; Stop recording
  LDI r14, 0
  SNAP_TRACE r14

  ; Now replay backward: show frames from newest to oldest
  LDI r10, 0         ; replay index (0 = newest)

replay_loop:
  LDI r14, 0
  ADD r14, r10        ; frame index to replay
  REPLAY r14

  ; Small delay between replay frames
  LDI r3, 0
delay:
  LDI r4, 1
  ADD r3, r4
  CMP r3, r15       ; short delay
  BLT r9, delay

  LDI r1, 1
  ADD r10, r1
  CMP r10, r15       ; replay all 16 frames
  BLT r9, replay_loop

  HALT
