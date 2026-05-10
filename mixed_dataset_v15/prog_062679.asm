; DESCRIPTION: Composite: Renders a green box of size 40x14 starting at (297, 5) then Places a orange dot at position (66, 57) then Renders a black disk with center (367, 170) and radius 29.
; PLAN: r0=297(x), r1=5(y), r2=40(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=57(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=367(x), r11=170(y), r12=29(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 297
LDI r1, 5
LDI r2, 40
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 57
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 367
LDI r11, 170
LDI r12, 29
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
