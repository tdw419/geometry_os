; DESCRIPTION: This GeOS assembly code demonstrates a simple multiprocess system where two processes run concurrently. The primary process draws a bouncing white dot in the left half of a 256x256 screen, while a spawned process simultaneously draws a bouncing red dot in the right half. Both dots bounce off the screen boundaries and share the same display buffer, with the primary process handling frame synchronization.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r3 = x position
;   r6 = y position
;   r13 = vx (velocity x)
;   r14 = vy (velocity y)
;   r2 = color (white)
;   r1 = scratch
;   r5 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r3, 32          ; start x = 32 (left half)
  LDI r6, 128         ; start y = 128
  LDI r13, 1           ; vx = +1
  LDI r14, 1           ; vy = +1
  LDI r2, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r5, red_proc
  SPAWN r5

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r1, 0
  PSET r3, r6, r1

  ; move
  ADD r3, r13
  ADD r6, r14

  ; bounce left wall (x = 0)
  LDI r1, 0
  CMP r3, r1
  JNZ r1, chk_rw
  LDI r13, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r1, 127
  CMP r3, r1
  JNZ r1, chk_tw
  LDI r13, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r1, 0
  CMP r6, r1
  JNZ r1, chk_bw
  LDI r14, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r1, 255
  CMP r6, r1
  JNZ r1, draw
  LDI r14, 0xFFFFFFFF

draw:
  PSET r3, r6, r2
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r3, 196         ; start x = 196 (right half)
  LDI r6, 64          ; start y = 64
  LDI r13, 0xFFFFFFFF          ; vx = -1
  LDI r14, 1           ; vy = +1
  LDI r2, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r1, 0
  PSET r3, r6, r1

  ; move
  ADD r3, r13
  ADD r6, r14

  ; bounce left wall of right half (x = 128)
  LDI r1, 128
  CMP r3, r1
  JNZ r1, red_chk_rw
  LDI r13, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r1, 255
  CMP r3, r1
  JNZ r1, red_chk_tw
  LDI r13, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r1, 0
  CMP r6, r1
  JNZ r1, red_chk_bw
  LDI r14, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r1, 255
  CMP r6, r1
  JNZ r1, red_draw
  LDI r14, 0xFFFFFFFF
red_draw:
  PSET r3, r6, r2
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
