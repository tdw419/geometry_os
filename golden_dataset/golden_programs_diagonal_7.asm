; DESCRIPTION: Render a green line at the screen.

; DIAGONAL_LINE -- Draw a diagonal line from (0,0) to (255,255)
; Uses PSET (register-based) in a loop
; Test: pixels at (i,i) for i in 0..255 should be green (0x00FF00)

LDI r0, 0            ; r0 = i (x and y counter)
LDI r6, 1            ; r6 = increment
LDI r4, 0x00FF00     ; r4 = green color (for PSET color register)
LDI r3, 256          ; r3 = limit
; PSET xr, yr, cr: set pixel at (regs[xr], regs[yr]) to regs[cr]
; We want PSET r0, r0, r4 -> pixel at (r0, r0) with color r4

loop:
PSET r0, r0, r4      ; pixel at (i, i) with green
ADD r0, r6           ; i++
; Check i == 256
LDI r9, 0
ADD r9, r0
SUB r9, r3
JZ r9, done
JMP loop

done:
HALT
