; DESCRIPTION: Composite: Renders a purple box of size 73x78 starting at (396, 90) then Places a blue dot at position (400, 252) then Places a cyan line segment connecting (108, 14) to (160, 145).
; PLAN: r0=396(x), r1=90(y), r2=73(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x), r6=252(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=108(x1), r11=14(y1), r12=160(x2), r13=145(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 90
LDI r2, 73
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 252
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 108
LDI r11, 14
LDI r12, 160
LDI r13, 145
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
