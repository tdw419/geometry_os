; DESCRIPTION: Composite: Places a orange 97x26 rectangle at position (214, 199) then Renders a green line between points (58, 146) and (169, 45) then Places a blue dot at position (302, 170).
; PLAN: r0=214(x), r1=199(y), r2=97(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x1), r6=146(y1), r7=169(x2), r8=45(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=302(x), r11=170(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 214
LDI r1, 199
LDI r2, 97
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 146
LDI r7, 169
LDI r8, 45
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 302
LDI r11, 170
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
