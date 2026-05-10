; DESCRIPTION: Composite: Renders a green line between points (129, 206) and (147, 191) then Creates a magenta rectangular region at (300, 172) spanning 119 by 33 pixels.
; PLAN: r0=129(x1), r1=206(y1), r2=147(x2), r3=191(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=300(x), r6=172(y), r7=119(width), r8=33(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 129
LDI r1, 206
LDI r2, 147
LDI r3, 191
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 172
LDI r7, 119
LDI r8, 33
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
