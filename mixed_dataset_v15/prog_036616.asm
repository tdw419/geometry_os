; DESCRIPTION: Composite: Places a yellow 47x78 rectangle at position (52, 81) then Places a blue dot at position (217, 164) then Draws a purple circle centered at (194, 154) with radius 64.
; PLAN: r0=52(x), r1=81(y), r2=47(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=164(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=194(x), r11=154(y), r12=64(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 52
LDI r1, 81
LDI r2, 47
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 164
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 194
LDI r11, 154
LDI r12, 64
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
