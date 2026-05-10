; DESCRIPTION: Composite: Creates a green rectangular region at (412, 8) spanning 20 by 76 pixels then Places a purple dot at position (252, 65) then Draws a green line from (364, 24) to (189, 70).
; PLAN: r0=412(x), r1=8(y), r2=20(width), r3=76(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=252(x), r6=65(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=364(x1), r11=24(y1), r12=189(x2), r13=70(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 412
LDI r1, 8
LDI r2, 20
LDI r3, 76
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 252
LDI r6, 65
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 364
LDI r11, 24
LDI r12, 189
LDI r13, 70
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
