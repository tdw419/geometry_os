; DESCRIPTION: Composite: Places a purple line segment connecting (141, 56) to (379, 105) then Renders a orange box of size 90x36 starting at (63, 46).
; PLAN: r0=141(x1), r1=56(y1), r2=379(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=63(x), r6=46(y), r7=90(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 56
LDI r2, 379
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 46
LDI r7, 90
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
