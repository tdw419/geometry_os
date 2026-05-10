; DESCRIPTION: Composite: Sets a single magenta pixel at (6, 164) then Places a orange line segment connecting (192, 204) to (183, 222).
; PLAN: r0=6(x), r1=164(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=192(x1), r6=204(y1), r7=183(x2), r8=222(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 6
LDI r1, 164
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 192
LDI r6, 204
LDI r7, 183
LDI r8, 222
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
