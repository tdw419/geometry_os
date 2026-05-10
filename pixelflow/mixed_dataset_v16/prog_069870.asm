; DESCRIPTION: Composite: Renders a purple disk with center (383, 117) and radius 72 then Places a orange line segment connecting (76, 60) to (373, 252).
; PLAN: r0=383(x), r1=117(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x1), r6=60(y1), r7=373(x2), r8=252(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 383
LDI r1, 117
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 60
LDI r7, 373
LDI r8, 252
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
