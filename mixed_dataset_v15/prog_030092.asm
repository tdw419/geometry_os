; DESCRIPTION: Composite: Creates a white rectangular region at (38, 13) spanning 26 by 103 pixels then Draws a blue circle centered at (204, 128) with radius 51.
; PLAN: r0=38(x), r1=13(y), r2=26(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x), r6=128(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 13
LDI r2, 26
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 128
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
