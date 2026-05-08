; DESCRIPTION: A green line centered at the screen with fixed size.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r2, 0            ; r2 = i (x and y counter)
LDI r11, 1            ; r11 = increment
LDI r15, 0x00FF00     ; r15 = green color (for PSET color register)
LDI r8, 256          ; r8 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r2, r2, r15 -> pixel at (r2, r2) with color r15

loop:
PSET r2, r2, r15      ; pixel at (i, i) with green
ADD r2, r11           ; i++
; Check i == 256
LDI r12, 0
ADD r12, r2
SUB r12, r8
JZ r12, done
JMP loop

done:
HALT
