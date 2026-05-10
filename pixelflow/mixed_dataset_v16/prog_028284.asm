; DESCRIPTION: Composite: Draws a yellow rectangle at (179, 64) with width 100 and height 71 then Renders a orange disk with center (128, 177) and radius 70.
; PLAN: r0=179(x), r1=64(y), r2=100(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=128(x), r6=177(y), r7=70(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 179
LDI r1, 64
LDI r2, 100
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 177
LDI r7, 70
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
