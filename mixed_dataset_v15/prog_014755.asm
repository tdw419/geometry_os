; DESCRIPTION: Composite: Draws a green line from (418, 110) to (301, 231) then Sets a single blue pixel at (135, 71) then Renders a orange box of size 77x34 starting at (86, 33).
; PLAN: r0=418(x1), r1=110(y1), r2=301(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=71(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=86(x), r11=33(y), r12=77(width), r13=34(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 110
LDI r2, 301
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 71
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 86
LDI r11, 33
LDI r12, 77
LDI r13, 34
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
