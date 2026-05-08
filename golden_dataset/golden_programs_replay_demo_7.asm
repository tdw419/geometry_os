; DESCRIPTION: This GeOS assembly code records and displays a vertical color bar moving across the screen for 16 frames, then replays those frames backward using the REPLAY opcode. The code utilizes SNAP_TRACE to start and stop recording, FRAME to checkpoint each frame during drawing, and SCREENP to draw pixels on the screen.

; replay_demo.asm -- Draw frames, then replay them backward
;
; Phase 38c demo: Uses SNAP_TRACE to record, FRAME to checkpoint,
; then REPLAY to display frames in reverse.
;
; Draws a vertical color bar that moves across the screen for 16 frames,
; then replays those frames backward using the REPLAY opcode.

  LDI r8, 1         ; mode = start recording
  SNAP_TRACE r8      ; begin trace recording

  LDI r12, 0         ; frame counter
  LDI r9, 16        ; total frames to draw
  LDI r4, 0         ; bar x position

draw_loop:
  ; Clear screen to black
  LDI r11, 0
  FILL r11

  ; Draw a vertical bar at position r4
  LDI r7, 0          ; y = 0
  LDI r2, 256        ; y limit
  LDI r1, 0x00FF00   ; green bar color
  LDI r14, 4          ; bar width

bar_y:
  ; Draw 4 pixels wide at (r4, r7)
  LDI r13, 0
bar_x:
  LDI r0, 0
  ADD r0, r4
  ADD r0, r13         ; x = bar_pos + offset
  SCREENP r0, r7, r1    ; set pixel
  LDI r5, 1
  ADD r13, r5
  CMP r13, r14
  BLT r10, bar_x

  LDI r5, 1
  ADD r7, r5
  CMP r7, r2
  BLT r10, bar_y

  ; Advance bar position
  LDI r5, 16
  ADD r4, r5

  ; Show frame (also triggers checkpoint since trace recording is on)
  FRAME

  LDI r5, 1
  ADD r12, r5
  CMP r12, r9
  BLT r10, draw_loop

  ; Stop recording
  LDI r8, 0
  SNAP_TRACE r8

  ; Now replay backward: show frames from newest to oldest
  LDI r15, 0         ; replay index (0 = newest)

replay_loop:
  LDI r8, 0
  ADD r8, r15        ; frame index to replay
  REPLAY r8

  ; Small delay between replay frames
  LDI r3, 0
delay:
  LDI r6, 1
  ADD r3, r6
  CMP r3, r9       ; short delay
  BLT r10, delay

  LDI r5, 1
  ADD r15, r5
  CMP r15, r9       ; replay all 16 frames
  BLT r10, replay_loop

  HALT
