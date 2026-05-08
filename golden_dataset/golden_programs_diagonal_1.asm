; DESCRIPTION: Display a line using color green at the screen.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r1, 0            ; r1 = i (x and y counter)
LDI r6, 1            ; r6 = increment
LDI r2, 0x00FF00     ; r2 = green color (for PSET color register)
LDI r14, 256          ; r14 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r1, r1, r2 -> pixel at (r1, r1) with color r2

loop:
PSET r1, r1, r2      ; pixel at (i, i) with green
ADD r1, r6           ; i++
; Check i == 256
LDI r5, 0
ADD r5, r1
SUB r5, r14
JZ r5, done
JMP loop

done:
HALT
