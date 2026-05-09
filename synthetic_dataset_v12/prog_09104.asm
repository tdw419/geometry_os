; DESCRIPTION: Composite: Sets a single orange pixel at (420, 18) then Draws a magenta line from (399, 204) to (273, 30).
; PLAN: r0=420(x), r1=18(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=399(x1), r6=204(y1), r7=273(x2), r8=30(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 420
LDI r1, 18
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 399
LDI r6, 204
LDI r7, 273
LDI r8, 30
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
