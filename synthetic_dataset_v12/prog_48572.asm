; DESCRIPTION: Composite: Places a cyan line segment connecting (152, 92) to (491, 204) then Sets a single blue pixel at (203, 128) then Creates a green rectangular region at (287, 162) spanning 93 by 16 pixels.
; PLAN: r0=152(x1), r1=92(y1), r2=491(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=203(x), r6=128(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=287(x), r11=162(y), r12=93(width), r13=16(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 152
LDI r1, 92
LDI r2, 491
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 128
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 287
LDI r11, 162
LDI r12, 93
LDI r13, 16
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
