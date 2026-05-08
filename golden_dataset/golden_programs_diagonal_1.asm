; DESCRIPTION: This GeOS assembly code draws a diagonal line from the origin (0,0) to the point (255,255) by setting green pixels at each coordinate (i,i) for i ranging from 0 to 255 using a loop. The process involves incrementing an index register and plotting pixels until the limit of 256 is reached.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r2, 0            ; r2 = i (x and y counter)
LDI r5, 1            ; r5 = increment
LDI r11, 0x00FF00     ; r11 = green color (for PSET color register)
LDI r9, 256          ; r9 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r2, r2, r11 -> pixel at (r2, r2) with color r11

loop:
PSET r2, r2, r11      ; pixel at (i, i) with green
ADD r2, r5           ; i++
; Check i == 256
LDI r13, 0
ADD r13, r2
SUB r13, r9
JZ r13, done
JMP loop

done:
HALT
