; DESCRIPTION: Composite: Places a cyan dot at position (351, 123) then Renders a cyan line between points (287, 219) and (353, 95) then Creates a orange circular shape at (186, 107) with radius 67.
; PLAN: r0=351(x), r1=123(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=287(x1), r6=219(y1), r7=353(x2), r8=95(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=186(x), r11=107(y), r12=67(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 351
LDI r1, 123
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 287
LDI r6, 219
LDI r7, 353
LDI r8, 95
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 186
LDI r11, 107
LDI r12, 67
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
