; DESCRIPTION: Composite: Draws a black circle centered at (446, 67) with radius 35 then Renders a purple line between points (192, 224) and (427, 102).
; PLAN: r0=446(x), r1=67(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x1), r6=224(y1), r7=427(x2), r8=102(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 67
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 224
LDI r7, 427
LDI r8, 102
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
