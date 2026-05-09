; DESCRIPTION: Composite: Places a green dot at position (252, 109) then Draws a black line from (110, 212) to (29, 145) then Places a red 26x110 rectangle at position (106, 50).
; PLAN: r0=252(x), r1=109(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=110(x1), r6=212(y1), r7=29(x2), r8=145(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=106(x), r11=50(y), r12=26(width), r13=110(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 109
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 110
LDI r6, 212
LDI r7, 29
LDI r8, 145
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 50
LDI r12, 26
LDI r13, 110
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
