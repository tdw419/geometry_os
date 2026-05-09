; DESCRIPTION: Composite: Renders a red disk with center (150, 88) and radius 49 then Places a orange line segment connecting (191, 12) to (293, 137).
; PLAN: r0=150(x), r1=88(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x1), r6=12(y1), r7=293(x2), r8=137(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 88
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 12
LDI r7, 293
LDI r8, 137
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
