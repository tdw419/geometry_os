; DESCRIPTION: Composite: Creates a blue rectangular region at (237, 158) spanning 99 by 36 pixels then Sets a single orange pixel at (326, 28) then Draws a orange line from (309, 124) to (173, 208).
; PLAN: r0=237(x), r1=158(y), r2=99(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=326(x), r6=28(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=309(x1), r11=124(y1), r12=173(x2), r13=208(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 158
LDI r2, 99
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 28
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 309
LDI r11, 124
LDI r12, 173
LDI r13, 208
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
