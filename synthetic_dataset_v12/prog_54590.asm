; DESCRIPTION: Composite: Places a white line segment connecting (492, 136) to (408, 100) then Creates a yellow rectangular region at (201, 128) spanning 73 by 108 pixels.
; PLAN: r0=492(x1), r1=136(y1), r2=408(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=201(x), r6=128(y), r7=73(width), r8=108(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 492
LDI r1, 136
LDI r2, 408
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 128
LDI r7, 73
LDI r8, 108
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
