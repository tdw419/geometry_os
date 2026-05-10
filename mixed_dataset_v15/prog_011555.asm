; DESCRIPTION: Composite: Draws a white rectangle at (283, 118) with width 49 and height 51 then Places a yellow dot at position (421, 217) then Creates a cyan circular shape at (192, 118) with radius 76.
; PLAN: r0=283(x), r1=118(y), r2=49(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=421(x), r6=217(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=192(x), r11=118(y), r12=76(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 283
LDI r1, 118
LDI r2, 49
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 421
LDI r6, 217
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 192
LDI r11, 118
LDI r12, 76
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
