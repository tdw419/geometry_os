; DESCRIPTION: Geometry OS program to draw a green line.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r4, 0            ; r4 = i (x and y counter)
LDI r0, 1            ; r0 = increment
LDI r7, 0x00FF00     ; r7 = green color (for PSET color register)
LDI r2, 256          ; r2 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r4, r4, r7 -> pixel at (r4, r4) with color r7

loop:
PSET r4, r4, r7      ; pixel at (i, i) with green
ADD r4, r0           ; i++
; Check i == 256
LDI r11, 0
ADD r11, r4
SUB r11, r2
JZ r11, done
JMP loop

done:
HALT
