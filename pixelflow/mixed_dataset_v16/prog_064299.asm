; DESCRIPTION: Composite: Renders a green line between points (442, 28) and (227, 227) then Creates a blue rectangular region at (315, 62) spanning 112 by 80 pixels.
; PLAN: r0=442(x1), r1=28(y1), r2=227(x2), r3=227(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=315(x), r6=62(y), r7=112(width), r8=80(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 28
LDI r2, 227
LDI r3, 227
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 62
LDI r7, 112
LDI r8, 80
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
