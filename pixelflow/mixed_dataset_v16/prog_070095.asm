; DESCRIPTION: Composite: Draws a green line from (76, 77) to (303, 106) then Creates a blue rectangular region at (264, 52) spanning 95 by 44 pixels.
; PLAN: r0=76(x1), r1=77(y1), r2=303(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=52(y), r7=95(width), r8=44(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 76
LDI r1, 77
LDI r2, 303
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 52
LDI r7, 95
LDI r8, 44
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
