; DESCRIPTION: Composite: Draws a black line from (57, 233) to (163, 68) then Places a magenta dot at position (46, 219) then Places a orange 23x35 rectangle at position (281, 122).
; PLAN: r0=57(x1), r1=233(y1), r2=163(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=219(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=281(x), r11=122(y), r12=23(width), r13=35(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 57
LDI r1, 233
LDI r2, 163
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 219
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 281
LDI r11, 122
LDI r12, 23
LDI r13, 35
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
