; DESCRIPTION: Composite: Renders a blue line between points (312, 152) and (306, 194) then Creates a green rectangular region at (272, 7) spanning 98 by 62 pixels.
; PLAN: r0=312(x1), r1=152(y1), r2=306(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=7(y), r7=98(width), r8=62(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 312
LDI r1, 152
LDI r2, 306
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 7
LDI r7, 98
LDI r8, 62
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
