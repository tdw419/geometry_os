; DESCRIPTION: Composite: Draws a red circle centered at (433, 98) with radius 68 then Places a orange line segment connecting (237, 18) to (258, 70) then Renders a purple box of size 109x71 starting at (328, 118).
; PLAN: r0=433(x), r1=98(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x1), r6=18(y1), r7=258(x2), r8=70(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=328(x), r11=118(y), r12=109(width), r13=71(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 433
LDI r1, 98
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 18
LDI r7, 258
LDI r8, 70
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 328
LDI r11, 118
LDI r12, 109
LDI r13, 71
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
