; DESCRIPTION: Composite: Draws a white circle centered at (142, 181) with radius 73 then Renders a black box of size 83x107 starting at (347, 103).
; PLAN: r0=142(x), r1=181(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=347(x), r6=103(y), r7=83(width), r8=107(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 181
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 347
LDI r6, 103
LDI r7, 83
LDI r8, 107
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
