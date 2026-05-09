; DESCRIPTION: Composite: Renders a purple line between points (276, 224) and (286, 191) then Draws a orange circle centered at (425, 191) with radius 32.
; PLAN: r0=276(x1), r1=224(y1), r2=286(x2), r3=191(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=191(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 276
LDI r1, 224
LDI r2, 286
LDI r3, 191
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 191
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
