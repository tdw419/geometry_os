; DESCRIPTION: Composite: Draws a orange line from (319, 140) to (25, 54) then Sets a single green pixel at (75, 244) then Renders a green box of size 69x96 starting at (99, 139).
; PLAN: r0=319(x1), r1=140(y1), r2=25(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=75(x), r6=244(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=99(x), r11=139(y), r12=69(width), r13=96(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 319
LDI r1, 140
LDI r2, 25
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 75
LDI r6, 244
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 99
LDI r11, 139
LDI r12, 69
LDI r13, 96
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
