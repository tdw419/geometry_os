; DESCRIPTION: Composite: Renders a black box of size 112x95 starting at (141, 69) then Renders a purple disk with center (39, 185) and radius 18 then Sets a single blue pixel at (426, 255).
; PLAN: r0=141(x), r1=69(y), r2=112(width), r3=95(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=39(x), r6=185(y), r7=18(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=426(x), r11=255(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 141
LDI r1, 69
LDI r2, 112
LDI r3, 95
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 39
LDI r6, 185
LDI r7, 18
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 426
LDI r11, 255
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
