; DESCRIPTION: Composite: Places a orange dot at position (279, 227) then Renders a purple line between points (125, 37) and (134, 208) then Renders a blue box of size 75x55 starting at (314, 121).
; PLAN: r0=279(x), r1=227(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=125(x1), r6=37(y1), r7=134(x2), r8=208(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=121(y), r12=75(width), r13=55(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 227
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 125
LDI r6, 37
LDI r7, 134
LDI r8, 208
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 121
LDI r12, 75
LDI r13, 55
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
