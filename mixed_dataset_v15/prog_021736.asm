; DESCRIPTION: Composite: Places a purple line segment connecting (203, 183) to (62, 23) then Renders a magenta box of size 38x36 starting at (34, 192) then Sets a single white pixel at (117, 223).
; PLAN: r0=203(x1), r1=183(y1), r2=62(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=34(x), r6=192(y), r7=38(width), r8=36(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=117(x), r11=223(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 183
LDI r2, 62
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 192
LDI r7, 38
LDI r8, 36
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 117
LDI r11, 223
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
