; DESCRIPTION: Composite: Places a magenta line segment connecting (333, 184) to (105, 56) then Creates a black rectangular region at (403, 87) spanning 29 by 78 pixels.
; PLAN: r0=333(x1), r1=184(y1), r2=105(x2), r3=56(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=403(x), r6=87(y), r7=29(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 333
LDI r1, 184
LDI r2, 105
LDI r3, 56
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 87
LDI r7, 29
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
