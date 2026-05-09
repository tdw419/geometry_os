; DESCRIPTION: Composite: Places a orange circle of radius 32 at center (159, 145) then Places a yellow line segment connecting (472, 62) to (391, 68).
; PLAN: r0=159(x), r1=145(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x1), r6=62(y1), r7=391(x2), r8=68(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 145
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 62
LDI r7, 391
LDI r8, 68
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
