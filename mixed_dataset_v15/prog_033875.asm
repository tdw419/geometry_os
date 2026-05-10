; DESCRIPTION: Composite: Places a green line segment connecting (433, 159) to (106, 23) then Places a orange circle of radius 31 at center (184, 175).
; PLAN: r0=433(x1), r1=159(y1), r2=106(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=175(y), r7=31(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 433
LDI r1, 159
LDI r2, 106
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 175
LDI r7, 31
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
