; DESCRIPTION: Composite: Places a green line segment connecting (34, 224) to (452, 101) then Places a orange circle of radius 30 at center (473, 211).
; PLAN: r0=34(x1), r1=224(y1), r2=452(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=473(x), r6=211(y), r7=30(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 34
LDI r1, 224
LDI r2, 452
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 473
LDI r6, 211
LDI r7, 30
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
