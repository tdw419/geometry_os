; DESCRIPTION: Composite: Renders a purple line between points (89, 223) and (193, 72) then Renders a blue box of size 24x94 starting at (455, 31) then Places a orange dot at position (68, 165).
; PLAN: r0=89(x1), r1=223(y1), r2=193(x2), r3=72(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=31(y), r7=24(width), r8=94(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=68(x), r11=165(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 89
LDI r1, 223
LDI r2, 193
LDI r3, 72
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 31
LDI r7, 24
LDI r8, 94
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 165
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
