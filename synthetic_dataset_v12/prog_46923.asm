; DESCRIPTION: Composite: Creates a green rectangular region at (99, 35) spanning 39 by 102 pixels then Places a blue line segment connecting (105, 227) to (201, 154).
; PLAN: r0=99(x), r1=35(y), r2=39(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x1), r6=227(y1), r7=201(x2), r8=154(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 35
LDI r2, 39
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 227
LDI r7, 201
LDI r8, 154
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
