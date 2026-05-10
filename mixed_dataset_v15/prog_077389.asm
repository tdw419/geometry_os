; DESCRIPTION: Composite: Creates a white rectangular region at (237, 84) spanning 99 by 70 pixels then Places a yellow line segment connecting (160, 142) to (345, 227) then Sets a single blue pixel at (320, 87).
; PLAN: r0=237(x), r1=84(y), r2=99(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x1), r6=142(y1), r7=345(x2), r8=227(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=87(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 237
LDI r1, 84
LDI r2, 99
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 142
LDI r7, 345
LDI r8, 227
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 87
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
