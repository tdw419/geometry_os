; DESCRIPTION: Composite: Creates a black circular shape at (271, 120) with radius 66 then Places a purple line segment connecting (58, 245) to (292, 211).
; PLAN: r0=271(x), r1=120(y), r2=66(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x1), r6=245(y1), r7=292(x2), r8=211(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 120
LDI r2, 66
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 245
LDI r7, 292
LDI r8, 211
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
