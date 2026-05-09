; DESCRIPTION: Composite: Places a blue line segment connecting (396, 62) to (80, 230) then Creates a green rectangular region at (416, 66) spanning 25 by 87 pixels.
; PLAN: r0=396(x1), r1=62(y1), r2=80(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=66(y), r7=25(width), r8=87(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 396
LDI r1, 62
LDI r2, 80
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 66
LDI r7, 25
LDI r8, 87
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
