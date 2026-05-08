; DESCRIPTION: This GeOS assembly code draws a diagonal line from the origin (0,0) to the point (255,255) by setting green pixels at each coordinate (i,i) for i ranging from 0 to 255 using a loop. The process involves incrementing an index register and plotting pixels until the limit of 256 is reached.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r7, 0            ; r7 = i (x and y counter)
LDI r0, 1            ; r0 = increment
LDI r13, 0x00FF00     ; r13 = green color (for PSET color register)
LDI r14, 256          ; r14 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r7, r7, r13 -> pixel at (r7, r7) with color r13

loop:
PSET r7, r7, r13      ; pixel at (i, i) with green
ADD r7, r0           ; i++
; Check i == 256
LDI r1, 0
ADD r1, r7
SUB r1, r14
JZ r1, done
JMP loop

done:
HALT
