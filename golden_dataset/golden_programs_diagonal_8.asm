; DESCRIPTION: Display a line using color green at the screen.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r0, 0            ; r0 = i (x and y counter)
LDI r1, 1            ; r1 = increment
LDI r8, 0x00FF00     ; r8 = green color (for PSET color register)
LDI r2, 256          ; r2 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r0, r0, r8 -> pixel at (r0, r0) with color r8

loop:
PSET r0, r0, r8      ; pixel at (i, i) with green
ADD r0, r1           ; i++
; Check i == 256
LDI r11, 0
ADD r11, r0
SUB r11, r2
JZ r11, done
JMP loop

done:
HALT
