; DESCRIPTION: Composite: Draws a white rectangle at (283, 186) with width 100 and height 66 then Places a black dot at position (297, 108) then Renders a orange line between points (323, 169) and (137, 205).
; PLAN: r0=283(x), r1=186(y), r2=100(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=108(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=323(x1), r11=169(y1), r12=137(x2), r13=205(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 186
LDI r2, 100
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 108
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 323
LDI r11, 169
LDI r12, 137
LDI r13, 205
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
