; DESCRIPTION: Composite: Places a magenta line segment connecting (357, 85) to (122, 167) then Places a blue dot at position (16, 20).
; PLAN: r0=357(x1), r1=85(y1), r2=122(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=16(x), r6=20(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 357
LDI r1, 85
LDI r2, 122
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 20
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
