; DESCRIPTION: Composite: Places a green dot at position (331, 13) then Draws a cyan line from (148, 22) to (109, 123) then Creates a black rectangular region at (128, 117) spanning 117 by 92 pixels.
; PLAN: r0=331(x), r1=13(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=148(x1), r6=22(y1), r7=109(x2), r8=123(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=128(x), r11=117(y), r12=117(width), r13=92(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 13
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 148
LDI r6, 22
LDI r7, 109
LDI r8, 123
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 117
LDI r12, 117
LDI r13, 92
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
