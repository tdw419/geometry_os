; DESCRIPTION: This GeOS assembly code draws a diagonal line from the origin (0,0) to the point (255,255) by setting green pixels at each coordinate (i,i) for i ranging from 0 to 255 using a loop. The process involves incrementing an index register and plotting pixels until the limit of 256 is reached.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r15, 0            ; r15 = i (x and y counter)
LDI r2, 1            ; r2 = increment
LDI r12, 0x00FF00     ; r12 = green color (for PSET color register)
LDI r13, 256          ; r13 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r15, r15, r12 -> pixel at (r15, r15) with color r12

loop:
PSET r15, r15, r12      ; pixel at (i, i) with green
ADD r15, r2           ; i++
; Check i == 256
LDI r10, 0
ADD r10, r15
SUB r10, r13
JZ r10, done
JMP loop

done:
HALT
