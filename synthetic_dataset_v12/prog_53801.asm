; DESCRIPTION: Composite: Places a yellow line segment connecting (256, 26) to (76, 80) then Creates a white rectangular region at (130, 56) spanning 10 by 84 pixels.
; PLAN: r0=256(x1), r1=26(y1), r2=76(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=56(y), r7=10(width), r8=84(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 256
LDI r1, 26
LDI r2, 76
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 56
LDI r7, 10
LDI r8, 84
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
