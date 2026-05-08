; DESCRIPTION: This GeOS assembly code draws a diagonal line from the origin (0,0) to the point (255,255) by setting green pixels at each coordinate (i,i) for i ranging from 0 to 255 using a loop. The process involves incrementing an index register and plotting pixels until the limit of 256 is reached.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r8, 0            ; r8 = i (x and y counter)
LDI r9, 1            ; r9 = increment
LDI r5, 0x00FF00     ; r5 = green color (for PSET color register)
LDI r12, 256          ; r12 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r8, r8, r5 -> pixel at (r8, r8) with color r5

loop:
PSET r8, r8, r5      ; pixel at (i, i) with green
ADD r8, r9           ; i++
; Check i == 256
LDI r14, 0
ADD r14, r8
SUB r14, r12
JZ r14, done
JMP loop

done:
HALT
