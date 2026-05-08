; DESCRIPTION: This GeOS assembly code demonstrates a simple multiprocess system where two processes run concurrently. The primary process draws a bouncing white dot in the left half of a 256x256 screen, while a spawned process simultaneously draws a bouncing red dot in the right half. Both dots bounce off the screen boundaries and share the same display buffer, with the primary process handling frame synchronization.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r12 = x position
;   r11 = y position
;   r9 = vx (velocity x)
;   r1 = vy (velocity y)
;   r7 = color (white)
;   r13 = scratch
;   r10 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r12, 32          ; start x = 32 (left half)
  LDI r11, 128         ; start y = 128
  LDI r9, 1           ; vx = +1
  LDI r1, 1           ; vy = +1
  LDI r7, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r10, red_proc
  SPAWN r10

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r13, 0
  PSET r12, r11, r13

  ; move
  ADD r12, r9
  ADD r11, r1

  ; bounce left wall (x = 0)
  LDI r13, 0
  CMP r12, r13
  JNZ r13, chk_rw
  LDI r9, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r13, 127
  CMP r12, r13
  JNZ r13, chk_tw
  LDI r9, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r13, 0
  CMP r11, r13
  JNZ r13, chk_bw
  LDI r1, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r13, 255
  CMP r11, r13
  JNZ r13, draw
  LDI r1, 0xFFFFFFFF

draw:
  PSET r12, r11, r7
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r12, 196         ; start x = 196 (right half)
  LDI r11, 64          ; start y = 64
  LDI r9, 0xFFFFFFFF          ; vx = -1
  LDI r1, 1           ; vy = +1
  LDI r7, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r13, 0
  PSET r12, r11, r13

  ; move
  ADD r12, r9
  ADD r11, r1

  ; bounce left wall of right half (x = 128)
  LDI r13, 128
  CMP r12, r13
  JNZ r13, red_chk_rw
  LDI r9, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r13, 255
  CMP r12, r13
  JNZ r13, red_chk_tw
  LDI r9, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r13, 0
  CMP r11, r13
  JNZ r13, red_chk_bw
  LDI r1, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r13, 255
  CMP r11, r13
  JNZ r13, red_draw
  LDI r1, 0xFFFFFFFF
red_draw:
  PSET r12, r11, r7
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
