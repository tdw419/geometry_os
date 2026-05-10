; DESCRIPTION: Composite: Places a blue dot at position (161, 21) then Renders a green box of size 67x39 starting at (248, 152) then Places a green line segment connecting (85, 232) to (508, 110).
; PLAN: r0=161(x), r1=21(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=248(x), r6=152(y), r7=67(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x1), r11=232(y1), r12=508(x2), r13=110(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 161
LDI r1, 21
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 248
LDI r6, 152
LDI r7, 67
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 232
LDI r12, 508
LDI r13, 110
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
