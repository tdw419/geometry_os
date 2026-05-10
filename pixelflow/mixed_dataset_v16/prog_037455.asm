; DESCRIPTION: Composite: Renders a yellow line between points (49, 114) and (47, 26) then Sets a single blue pixel at (227, 174) then Places a yellow 23x112 rectangle at position (20, 120).
; PLAN: r0=49(x1), r1=114(y1), r2=47(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=174(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=20(x), r11=120(y), r12=23(width), r13=112(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 114
LDI r2, 47
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 174
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 20
LDI r11, 120
LDI r12, 23
LDI r13, 112
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
