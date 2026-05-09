; DESCRIPTION: Composite: Places a orange line segment connecting (138, 0) to (411, 44) then Sets a single blue pixel at (259, 231) then Places a green 98x95 rectangle at position (219, 5).
; PLAN: r0=138(x1), r1=0(y1), r2=411(x2), r3=44(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=231(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=219(x), r11=5(y), r12=98(width), r13=95(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 0
LDI r2, 411
LDI r3, 44
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 231
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 219
LDI r11, 5
LDI r12, 98
LDI r13, 95
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
