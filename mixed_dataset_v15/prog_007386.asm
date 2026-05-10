; DESCRIPTION: Composite: Draws a magenta rectangle at (288, 32) with width 62 and height 83 then Renders a black disk with center (271, 132) and radius 31.
; PLAN: r0=288(x), r1=32(y), r2=62(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=271(x), r6=132(y), r7=31(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 288
LDI r1, 32
LDI r2, 62
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 132
LDI r7, 31
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
