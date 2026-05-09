; DESCRIPTION: Composite: Renders a white box of size 97x21 starting at (317, 69) then Places a green line segment connecting (194, 122) to (314, 244).
; PLAN: r0=317(x), r1=69(y), r2=97(width), r3=21(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=194(x1), r6=122(y1), r7=314(x2), r8=244(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 69
LDI r2, 97
LDI r3, 21
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 194
LDI r6, 122
LDI r7, 314
LDI r8, 244
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
