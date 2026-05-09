; DESCRIPTION: Composite: Renders a black line between points (104, 105) and (470, 138) then Places a magenta dot at position (63, 26) then Renders a black box of size 85x29 starting at (266, 130).
; PLAN: r0=104(x1), r1=105(y1), r2=470(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=26(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=266(x), r11=130(y), r12=85(width), r13=29(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 105
LDI r2, 470
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 26
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 266
LDI r11, 130
LDI r12, 85
LDI r13, 29
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
