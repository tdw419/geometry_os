; DESCRIPTION: Composite: Places a orange line segment connecting (320, 61) to (189, 133) then Sets a single green pixel at (424, 5) then Creates a purple rectangular region at (334, 161) spanning 35 by 32 pixels.
; PLAN: r0=320(x1), r1=61(y1), r2=189(x2), r3=133(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=424(x), r6=5(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=334(x), r11=161(y), r12=35(width), r13=32(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 61
LDI r2, 189
LDI r3, 133
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 5
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 334
LDI r11, 161
LDI r12, 35
LDI r13, 32
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
