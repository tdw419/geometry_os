; DESCRIPTION: This GeOS assembly code demonstrates a simple multiprocess system where two processes run concurrently. The primary process draws a bouncing white dot in the left half of a 256x256 screen, while a spawned process simultaneously draws a bouncing red dot in the right half. Both dots bounce off the screen boundaries and share the same display buffer, with the primary process handling frame synchronization.

; multiproc.asm -- SPATIAL_SPAWN demo
;
; Primary process: draws a bouncing white dot in the LEFT half (x: 0..127)
; Spawned process: draws a bouncing red  dot in the RIGHT half (x: 128..255)
; Both share the same 256x256 screen and run concurrently via SPAWN.
;
; Register layout (primary):
;   r9 = x position
;   r14 = y position
;   r10 = vx (velocity x)
;   r6 = vy (velocity y)
;   r0 = color (white)
;   r13 = scratch
;   r4 = spawn address

; ── init primary ──────────────────────────────────────────────────────────────
  LDI r9, 32          ; start x = 32 (left half)
  LDI r14, 128         ; start y = 128
  LDI r10, 1           ; vx = +1
  LDI r6, 1           ; vy = +1
  LDI r0, 0xFFFFFF    ; white

  ; spawn the red-dot process
  LDI r4, red_proc
  SPAWN r4

; ── primary game loop ─────────────────────────────────────────────────────────
loop:
  ; erase old pixel
  LDI r13, 0
  PSET r9, r14, r13

  ; move
  ADD r9, r10
  ADD r14, r6

  ; bounce left wall (x = 0)
  LDI r13, 0
  CMP r9, r13
  JNZ r13, chk_rw
  LDI r10, 1
chk_rw:
  ; bounce right wall of left half (x = 127)
  LDI r13, 127
  CMP r9, r13
  JNZ r13, chk_tw
  LDI r10, 0xFFFFFFFF
chk_tw:
  ; bounce top wall (y = 0)
  LDI r13, 0
  CMP r14, r13
  JNZ r13, chk_bw
  LDI r6, 1
chk_bw:
  ; bounce bottom wall (y = 255)
  LDI r13, 255
  CMP r14, r13
  JNZ r13, draw
  LDI r6, 0xFFFFFFFF

draw:
  PSET r9, r14, r0
  FRAME
  JMP loop

; ── spawned process: red dot in right half ─────────────────────────────────────
; Spawned processes start with zeroed registers, so we initialise everything here.
red_proc:
  LDI r9, 196         ; start x = 196 (right half)
  LDI r14, 64          ; start y = 64
  LDI r10, 0xFFFFFFFF          ; vx = -1
  LDI r6, 1           ; vy = +1
  LDI r0, 0xFF2020    ; red

red_loop:
  ; erase
  LDI r13, 0
  PSET r9, r14, r13

  ; move
  ADD r9, r10
  ADD r14, r6

  ; bounce left wall of right half (x = 128)
  LDI r13, 128
  CMP r9, r13
  JNZ r13, red_chk_rw
  LDI r10, 1
red_chk_rw:
  ; bounce right wall (x = 255)
  LDI r13, 255
  CMP r9, r13
  JNZ r13, red_chk_tw
  LDI r10, 0xFFFFFFFF
red_chk_tw:
  ; bounce top (y = 0)
  LDI r13, 0
  CMP r14, r13
  JNZ r13, red_chk_bw
  LDI r6, 1
red_chk_bw:
  ; bounce bottom (y = 255)
  LDI r13, 255
  CMP r14, r13
  JNZ r13, red_draw
  LDI r6, 0xFFFFFFFF
red_draw:
  PSET r9, r14, r0
  ; No FRAME here — the primary process drives frame sync
  JMP red_loop
