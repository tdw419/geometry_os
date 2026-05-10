; DESCRIPTION: Composite: Places a green line segment connecting (379, 181) to (7, 160) then Creates a white rectangular region at (377, 143) spanning 66 by 89 pixels.
; PLAN: r0=379(x1), r1=181(y1), r2=7(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=143(y), r7=66(width), r8=89(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 379
LDI r1, 181
LDI r2, 7
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 143
LDI r7, 66
LDI r8, 89
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
