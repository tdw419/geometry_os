; DESCRIPTION: Composite: Places a purple dot at position (252, 246) then Renders a blue disk with center (397, 102) and radius 31 then Places a yellow line segment connecting (8, 11) to (40, 96).
; PLAN: r0=252(x), r1=246(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=397(x), r6=102(y), r7=31(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x1), r11=11(y1), r12=40(x2), r13=96(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 246
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 397
LDI r6, 102
LDI r7, 31
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 11
LDI r12, 40
LDI r13, 96
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
