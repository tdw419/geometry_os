; DESCRIPTION: This GeOS assembly code draws a diagonal line from the origin (0,0) to the point (255,255) by setting green pixels at each coordinate (i,i) for i ranging from 0 to 255 using a loop. The process involves incrementing an index register and plotting pixels until the limit of 256 is reached.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r14, 0            ; r14 = i (x and y counter)
LDI r7, 1            ; r7 = increment
LDI r11, 0x00FF00     ; r11 = green color (for PSET color register)
LDI r1, 256          ; r1 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r14, r14, r11 -> pixel at (r14, r14) with color r11

loop:
PSET r14, r14, r11      ; pixel at (i, i) with green
ADD r14, r7           ; i++
; Check i == 256
LDI r10, 0
ADD r10, r14
SUB r10, r1
JZ r10, done
JMP loop

done:
HALT
