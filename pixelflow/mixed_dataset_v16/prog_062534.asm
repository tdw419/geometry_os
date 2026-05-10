; DESCRIPTION: Composite: Places a blue line segment connecting (392, 65) to (6, 48) then Places a cyan dot at position (395, 48) then Creates a orange rectangular region at (390, 83) spanning 38 by 101 pixels.
; PLAN: r0=392(x1), r1=65(y1), r2=6(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=48(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=390(x), r11=83(y), r12=38(width), r13=101(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 65
LDI r2, 6
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 48
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 390
LDI r11, 83
LDI r12, 38
LDI r13, 101
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
