; DESCRIPTION: Composite: Draws a purple line from (24, 154) to (169, 69) then Places a purple dot at position (2, 157) then Places a red 15x78 rectangle at position (431, 64).
; PLAN: r0=24(x1), r1=154(y1), r2=169(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=2(x), r6=157(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=431(x), r11=64(y), r12=15(width), r13=78(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 24
LDI r1, 154
LDI r2, 169
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 157
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 431
LDI r11, 64
LDI r12, 15
LDI r13, 78
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
