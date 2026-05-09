; DESCRIPTION: Composite: Draws a black rectangle at (81, 120) with width 108 and height 96 then Places a orange dot at position (32, 49) then Draws a green circle centered at (285, 179) with radius 31.
; PLAN: r0=81(x), r1=120(y), r2=108(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=32(x), r6=49(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=285(x), r11=179(y), r12=31(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 81
LDI r1, 120
LDI r2, 108
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 32
LDI r6, 49
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 285
LDI r11, 179
LDI r12, 31
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
