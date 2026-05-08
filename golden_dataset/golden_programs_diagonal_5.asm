; DESCRIPTION: This GeOS assembly code draws a diagonal line from the origin (0,0) to the point (255,255) by setting green pixels at each coordinate (i,i) for i ranging from 0 to 255 using a loop. The process involves incrementing an index register and plotting pixels until the limit of 256 is reached.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r13, 0            ; r13 = i (x and y counter)
LDI r10, 1            ; r10 = increment
LDI r1, 0x00FF00     ; r1 = green color (for PSET color register)
LDI r5, 256          ; r5 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r13, r13, r1 -> pixel at (r13, r13) with color r1

loop:
PSET r13, r13, r1      ; pixel at (i, i) with green
ADD r13, r10           ; i++
; Check i == 256
LDI r15, 0
ADD r15, r13
SUB r15, r5
JZ r15, done
JMP loop

done:
HALT
