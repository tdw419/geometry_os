; DESCRIPTION: Composite: Renders a purple box of size 64x34 starting at (419, 120) then Draws a blue circle centered at (194, 122) with radius 57.
; PLAN: r0=419(x), r1=120(y), r2=64(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=122(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 419
LDI r1, 120
LDI r2, 64
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 122
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
