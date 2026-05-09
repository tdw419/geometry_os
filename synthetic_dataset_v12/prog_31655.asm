; DESCRIPTION: Composite: Places a green line segment connecting (500, 45) to (135, 97) then Places a yellow dot at position (294, 128) then Creates a green rectangular region at (84, 132) spanning 119 by 65 pixels.
; PLAN: r0=500(x1), r1=45(y1), r2=135(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=128(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=84(x), r11=132(y), r12=119(width), r13=65(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 500
LDI r1, 45
LDI r2, 135
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 128
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 84
LDI r11, 132
LDI r12, 119
LDI r13, 65
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
