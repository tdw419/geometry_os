; DESCRIPTION: Composite: Draws a orange line from (197, 218) to (69, 233) then Places a purple dot at position (500, 92) then Places a purple 63x49 rectangle at position (99, 140).
; PLAN: r0=197(x1), r1=218(y1), r2=69(x2), r3=233(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=500(x), r6=92(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=99(x), r11=140(y), r12=63(width), r13=49(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 218
LDI r2, 69
LDI r3, 233
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 500
LDI r6, 92
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 99
LDI r11, 140
LDI r12, 63
LDI r13, 49
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
