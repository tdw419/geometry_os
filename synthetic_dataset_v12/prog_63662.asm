; DESCRIPTION: Composite: Draws a black circle centered at (166, 185) with radius 49 then Places a black line segment connecting (195, 67) to (337, 218).
; PLAN: r0=166(x), r1=185(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x1), r6=67(y1), r7=337(x2), r8=218(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 185
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 67
LDI r7, 337
LDI r8, 218
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
