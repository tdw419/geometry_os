; DESCRIPTION: Composite: Draws a black rectangle at (288, 77) with width 88 and height 116 then Creates a magenta circular shape at (367, 153) with radius 35.
; PLAN: r0=288(x), r1=77(y), r2=88(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=367(x), r6=153(y), r7=35(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 77
LDI r2, 88
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 153
LDI r7, 35
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
