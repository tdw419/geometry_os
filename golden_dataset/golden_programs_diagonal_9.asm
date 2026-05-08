; DESCRIPTION: This GeOS assembly code draws a diagonal line from the origin (0,0) to the point (255,255) by setting green pixels at each coordinate (i,i) for i ranging from 0 to 255 using a loop. The process involves incrementing an index register and plotting pixels until the limit of 256 is reached.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r4, 0            ; r4 = i (x and y counter)
LDI r1, 1            ; r1 = increment
LDI r2, 0x00FF00     ; r2 = green color (for PSET color register)
LDI r10, 256          ; r10 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r4, r4, r2 -> pixel at (r4, r4) with color r2

loop:
PSET r4, r4, r2      ; pixel at (i, i) with green
ADD r4, r1           ; i++
; Check i == 256
LDI r11, 0
ADD r11, r4
SUB r11, r10
JZ r11, done
JMP loop

done:
HALT
