; DESCRIPTION: Composite: Places a green 105x106 rectangle at position (45, 46) then Places a blue line segment connecting (123, 6) to (36, 47) then Places a green dot at position (476, 183).
; PLAN: r0=45(x), r1=46(y), r2=105(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x1), r6=6(y1), r7=36(x2), r8=47(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=476(x), r11=183(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 45
LDI r1, 46
LDI r2, 105
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 6
LDI r7, 36
LDI r8, 47
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 476
LDI r11, 183
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
