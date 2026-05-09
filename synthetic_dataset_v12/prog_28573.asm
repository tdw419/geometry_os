; DESCRIPTION: Composite: Renders a blue box of size 19x28 starting at (142, 175) then Renders a purple disk with center (241, 31) and radius 14.
; PLAN: r0=142(x), r1=175(y), r2=19(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=241(x), r6=31(y), r7=14(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 142
LDI r1, 175
LDI r2, 19
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 31
LDI r7, 14
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
