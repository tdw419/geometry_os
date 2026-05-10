; DESCRIPTION: Composite: Places a purple dot at position (375, 25) then Places a purple line segment connecting (46, 94) to (491, 171) then Creates a blue rectangular region at (203, 109) spanning 99 by 50 pixels.
; PLAN: r0=375(x), r1=25(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=46(x1), r6=94(y1), r7=491(x2), r8=171(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=203(x), r11=109(y), r12=99(width), r13=50(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 25
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 46
LDI r6, 94
LDI r7, 491
LDI r8, 171
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 203
LDI r11, 109
LDI r12, 99
LDI r13, 50
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
