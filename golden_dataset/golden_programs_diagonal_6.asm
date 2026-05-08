; DESCRIPTION: Geometry OS program to draw a green line.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r3, 0            ; r3 = i (x and y counter)
LDI r12, 1            ; r12 = increment
LDI r7, 0x00FF00     ; r7 = green color (for PSET color register)
LDI r14, 256          ; r14 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r3, r3, r7 -> pixel at (r3, r3) with color r7

loop:
PSET r3, r3, r7      ; pixel at (i, i) with green
ADD r3, r12           ; i++
; Check i == 256
LDI r11, 0
ADD r11, r3
SUB r11, r14
JZ r11, done
JMP loop

done:
HALT
