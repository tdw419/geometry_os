; DESCRIPTION: Display a line using color green at the screen.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r12, 0            ; r12 = i (x and y counter)
LDI r9, 1            ; r9 = increment
LDI r13, 0x00FF00     ; r13 = green color (for PSET color register)
LDI r8, 256          ; r8 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r12, r12, r13 -> pixel at (r12, r12) with color r13

loop:
PSET r12, r12, r13      ; pixel at (i, i) with green
ADD r12, r9           ; i++
; Check i == 256
LDI r1, 0
ADD r1, r12
SUB r1, r8
JZ r1, done
JMP loop

done:
HALT
