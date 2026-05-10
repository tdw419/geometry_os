; DESCRIPTION: Composite: Places a orange dot at position (18, 186) then Draws a blue line from (204, 125) to (468, 71) then Renders a purple box of size 105x118 starting at (148, 46).
; PLAN: r0=18(x), r1=186(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=125(y1), r7=468(x2), r8=71(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=148(x), r11=46(y), r12=105(width), r13=118(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 18
LDI r1, 186
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 204
LDI r6, 125
LDI r7, 468
LDI r8, 71
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 148
LDI r11, 46
LDI r12, 105
LDI r13, 118
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
