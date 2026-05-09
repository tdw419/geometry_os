; DESCRIPTION: Composite: Places a green line segment connecting (203, 99) to (119, 84) then Draws a purple circle centered at (392, 116) with radius 40.
; PLAN: r0=203(x1), r1=99(y1), r2=119(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=116(y), r7=40(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 203
LDI r1, 99
LDI r2, 119
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 116
LDI r7, 40
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
