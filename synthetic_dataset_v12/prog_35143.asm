; DESCRIPTION: Composite: Draws a black rectangle at (186, 154) with width 84 and height 58 then Creates a red circular shape at (194, 63) with radius 38.
; PLAN: r0=186(x), r1=154(y), r2=84(width), r3=58(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x), r6=63(y), r7=38(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 186
LDI r1, 154
LDI r2, 84
LDI r3, 58
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 63
LDI r7, 38
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
