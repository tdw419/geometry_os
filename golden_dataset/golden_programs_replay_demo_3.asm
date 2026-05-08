; DESCRIPTION: This GeOS assembly code records and displays a vertical color bar moving across the screen for 16 frames, then replays those frames backward using the REPLAY opcode. The code utilizes SNAP_TRACE to start and stop recording, FRAME to checkpoint each frame during drawing, and SCREENP to draw pixels on the screen.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r3, 1         ; mode = start recording
  SNAP_TRACE r3      ; begin trace recording

  LDI r2, 0         ; frame counter
  LDI r15, 16        ; total frames to draw
  LDI r6, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r11, 0
  FILL r11

  ; Draw a vertical bar at position r6
  LDI r1, 0          ; y = 0
  LDI r14, 256        ; y limit
  LDI r0, 0x00FF00   ; green bar color
  LDI r10, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r6, r1)
  LDI r9, 0
bar_x:
  LDI r12, 0
  ADD r12, r6
  ADD r12, r9         ; x = bar_pos + offset
  SCREENP r12, r1, r0    ; set pixel
  LDI r13, 1
  ADD r9, r13
  CMP r9, r10
  BLT r7, bar_x

  LDI r13, 1
  ADD r1, r13
  CMP r1, r14
  BLT r7, bar_y

  ; Advance bar position
  LDI r13, 16
  ADD r6, r13

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r13, 1
  ADD r2, r13
  CMP r2, r15
  BLT r7, draw_loop

  ; Stop recording
  LDI r3, 0
  SNAP_TRACE r3

  ; Now replay backward: show frames from newest to oldest
  LDI r8, 0         ; replay index (0 = newest)

replay_loop:
  LDI r3, 0
  ADD r3, r8        ; frame index to replay
  REPLAY r3

  ; Small delay between replay frames
  LDI r4, 0
delay:
  LDI r5, 1
  ADD r4, r5
  CMP r4, r15       ; short delay
  BLT r7, delay

  LDI r13, 1
  ADD r8, r13
  CMP r8, r15       ; replay all 16 frames
  BLT r7, replay_loop

  HALT
