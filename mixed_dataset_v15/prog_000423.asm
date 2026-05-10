; DESCRIPTION: Composite: Creates a black rectangular region at (168, 194) spanning 114 by 34 pixels then Places a cyan dot at position (176, 198) then Places a orange line segment connecting (244, 9) to (335, 58).
; PLAN: r0=168(x), r1=194(y), r2=114(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=176(x), r6=198(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=244(x1), r11=9(y1), r12=335(x2), r13=58(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 168
LDI r1, 194
LDI r2, 114
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 176
LDI r6, 198
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 244
LDI r11, 9
LDI r12, 335
LDI r13, 58
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
