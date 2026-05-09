; DESCRIPTION: Composite: Places a yellow 91x34 rectangle at position (151, 206) then Renders a purple line between points (109, 71) and (88, 220) then Places a blue dot at position (134, 136).
; PLAN: r0=151(x), r1=206(y), r2=91(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=109(x1), r6=71(y1), r7=88(x2), r8=220(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=134(x), r11=136(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 151
LDI r1, 206
LDI r2, 91
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 109
LDI r6, 71
LDI r7, 88
LDI r8, 220
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 136
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
