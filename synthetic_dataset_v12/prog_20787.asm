; DESCRIPTION: Composite: Places a orange 68x78 rectangle at position (216, 146) then Places a black dot at position (363, 39) then Draws a blue circle centered at (85, 139) with radius 65.
; PLAN: r0=216(x), r1=146(y), r2=68(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=363(x), r6=39(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=85(x), r11=139(y), r12=65(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 216
LDI r1, 146
LDI r2, 68
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 363
LDI r6, 39
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 85
LDI r11, 139
LDI r12, 65
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
