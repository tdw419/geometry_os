; DESCRIPTION: Composite: Renders a yellow disk with center (442, 105) and radius 48 then Draws a black rectangle at (118, 87) with width 118 and height 48 then Places a cyan dot at position (501, 77).
; PLAN: r0=442(x), r1=105(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=87(y), r7=118(width), r8=48(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=501(x), r11=77(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 442
LDI r1, 105
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 87
LDI r7, 118
LDI r8, 48
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 501
LDI r11, 77
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
