; DESCRIPTION: This GeOS assembly code demonstrates a simple multiprocess system where two processes run concurrently. The primary process draws a bouncing white dot in the left half of a 256x256 screen, while a spawned process simultaneously draws a bouncing red dot in the right half. Both dots bounce off the screen boundaries and share the same display buffer, with the primary process handling frame synchronization.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r15 = x position
;   r4 = y position
;   r3 = vx (velocity x)
;   r12 = vy (velocity y)
;   r13 = color (white)
;   r9 = scratch
;   r8 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r15, 32          ; start x = 32 (left half)
  LDI r4, 128         ; start y = 128
  LDI r3, 1           ; vx = +1
  LDI r12, 1           ; vy = +1
  LDI r13, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r8, red_proc
  SPAWN r8

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r9, 0
  PSET r15, r4, r9

  ; move
  ADD r15, r3
  ADD r4, r12

  ; bounce left wall (x = 0)
  LDI r9, 0
  CMP r15, r9
  JNZ r9, chk_rw
  LDI r3, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r9, 127
  CMP r15, r9
  JNZ r9, chk_tw
  LDI r3, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r9, 0
  CMP r4, r9
  JNZ r9, chk_bw
  LDI r12, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r9, 255
  CMP r4, r9
  JNZ r9, draw
  LDI r12, 0xFFFFFFFF

draw:
  PSET r15, r4, r13
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r15, 196         ; start x = 196 (right half)
  LDI r4, 64          ; start y = 64
  LDI r3, 0xFFFFFFFF          ; vx = -1
  LDI r12, 1           ; vy = +1
  LDI r13, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r9, 0
  PSET r15, r4, r9

  ; move
  ADD r15, r3
  ADD r4, r12

  ; bounce left wall of right half (x = 128)
  LDI r9, 128
  CMP r15, r9
  JNZ r9, red_chk_rw
  LDI r3, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r9, 255
  CMP r15, r9
  JNZ r9, red_chk_tw
  LDI r3, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r9, 0
  CMP r4, r9
  JNZ r9, red_chk_bw
  LDI r12, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r9, 255
  CMP r4, r9
  JNZ r9, red_draw
  LDI r12, 0xFFFFFFFF
red_draw:
  PSET r15, r4, r13
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
