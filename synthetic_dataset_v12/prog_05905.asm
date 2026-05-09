; DESCRIPTION: Composite: Places a yellow line segment connecting (418, 105) to (113, 108) then Creates a blue rectangular region at (463, 98) spanning 26 by 90 pixels.
; PLAN: r0=418(x1), r1=105(y1), r2=113(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=98(y), r7=26(width), r8=90(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 418
LDI r1, 105
LDI r2, 113
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 98
LDI r7, 26
LDI r8, 90
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
