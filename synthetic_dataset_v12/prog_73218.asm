; DESCRIPTION: Composite: Places a green circle of radius 32 at center (82, 68) then Creates a orange rectangular region at (258, 24) spanning 114 by 117 pixels then Draws a black line from (234, 154) to (295, 35).
; PLAN: r0=82(x), r1=68(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x), r6=24(y), r7=114(width), r8=117(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x1), r11=154(y1), r12=295(x2), r13=35(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 68
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 24
LDI r7, 114
LDI r8, 117
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 154
LDI r12, 295
LDI r13, 35
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
