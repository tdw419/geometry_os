; DESCRIPTION: Composite: Draws a magenta line from (293, 184) to (169, 208) then Places a green dot at position (302, 150) then Draws a orange rectangle at (205, 118) with width 67 and height 33.
; PLAN: r0=293(x1), r1=184(y1), r2=169(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=150(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=205(x), r11=118(y), r12=67(width), r13=33(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 293
LDI r1, 184
LDI r2, 169
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 150
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 205
LDI r11, 118
LDI r12, 67
LDI r13, 33
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
