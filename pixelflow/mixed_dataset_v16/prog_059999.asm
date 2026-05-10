; DESCRIPTION: Composite: Places a purple 26x49 rectangle at position (58, 128) then Draws a green line from (169, 83) to (109, 79).
; PLAN: r0=58(x), r1=128(y), r2=26(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x1), r6=83(y1), r7=109(x2), r8=79(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 128
LDI r2, 26
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 83
LDI r7, 109
LDI r8, 79
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
