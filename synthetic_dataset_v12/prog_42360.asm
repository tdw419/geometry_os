; DESCRIPTION: Composite: Places a orange circle of radius 24 at center (481, 187) then Places a purple line segment connecting (452, 2) to (288, 254).
; PLAN: r0=481(x), r1=187(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x1), r6=2(y1), r7=288(x2), r8=254(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 481
LDI r1, 187
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 2
LDI r7, 288
LDI r8, 254
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
