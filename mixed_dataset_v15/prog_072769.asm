; DESCRIPTION: Composite: Renders a blue line between points (409, 121) and (114, 224) then Creates a blue rectangular region at (73, 49) spanning 98 by 97 pixels.
; PLAN: r0=409(x1), r1=121(y1), r2=114(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=49(y), r7=98(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 121
LDI r2, 114
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 49
LDI r7, 98
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
