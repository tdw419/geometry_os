; DESCRIPTION: Composite: Creates a orange rectangular region at (314, 120) spanning 22 by 34 pixels then Draws a blue line from (469, 92) to (219, 0) then Sets a single black pixel at (394, 84).
; PLAN: r0=314(x), r1=120(y), r2=22(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=469(x1), r6=92(y1), r7=219(x2), r8=0(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=394(x), r11=84(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 314
LDI r1, 120
LDI r2, 22
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 469
LDI r6, 92
LDI r7, 219
LDI r8, 0
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 84
LDI r12, 0x000000
PSET r10, r11, r12
HALT
