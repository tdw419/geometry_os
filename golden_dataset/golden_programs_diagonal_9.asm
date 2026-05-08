; DESCRIPTION: Geometry OS program to draw a green line.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r6, 0            ; r6 = i (x and y counter)
LDI r5, 1            ; r5 = increment
LDI r4, 0x00FF00     ; r4 = green color (for PSET color register)
LDI r12, 256          ; r12 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r6, r6, r4 -> pixel at (r6, r6) with color r4

loop:
PSET r6, r6, r4      ; pixel at (i, i) with green
ADD r6, r5           ; i++
; Check i == 256
LDI r13, 0
ADD r13, r6
SUB r13, r12
JZ r13, done
JMP loop

done:
HALT
