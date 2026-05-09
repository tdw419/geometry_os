; DESCRIPTION: Composite: Draws a black line from (288, 244) to (59, 61) then Creates a green rectangular region at (329, 110) spanning 84 by 48 pixels then Sets a single cyan pixel at (192, 106).
; PLAN: r0=288(x1), r1=244(y1), r2=59(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=110(y), r7=84(width), r8=48(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=192(x), r11=106(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 244
LDI r2, 59
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 110
LDI r7, 84
LDI r8, 48
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 192
LDI r11, 106
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
