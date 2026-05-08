; DESCRIPTION: This GeOS assembly code draws a diagonal line from the origin (0,0) to the point (255,255) by setting green pixels at each coordinate (i,i) for i ranging from 0 to 255 using a loop. The process involves incrementing an index register and plotting pixels until the limit of 256 is reached.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r6, 0            ; r6 = i (x and y counter)
LDI r12, 1            ; r12 = increment
LDI r2, 0x00FF00     ; r2 = green color (for PSET color register)
LDI r3, 256          ; r3 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r6, r6, r2 -> pixel at (r6, r6) with color r2

loop:
PSET r6, r6, r2      ; pixel at (i, i) with green
ADD r6, r12           ; i++
; Check i == 256
LDI r1, 0
ADD r1, r6
SUB r1, r3
JZ r1, done
JMP loop

done:
HALT
