; DESCRIPTION: Composite: Creates a blue rectangular region at (64, 198) spanning 101 by 18 pixels then Renders a purple disk with center (145, 157) and radius 43.
; PLAN: r0=64(x), r1=198(y), r2=101(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=157(y), r7=43(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 64
LDI r1, 198
LDI r2, 101
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 157
LDI r7, 43
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
