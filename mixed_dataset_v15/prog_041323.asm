; DESCRIPTION: Composite: Places a magenta dot at position (255, 107) then Draws a orange line from (178, 219) to (204, 124).
; PLAN: r0=255(x), r1=107(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=178(x1), r6=219(y1), r7=204(x2), r8=124(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 255
LDI r1, 107
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 178
LDI r6, 219
LDI r7, 204
LDI r8, 124
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
