; DESCRIPTION: Composite: Renders a black line between points (225, 74) and (498, 7) then Creates a green rectangular region at (65, 138) spanning 119 by 100 pixels.
; PLAN: r0=225(x1), r1=74(y1), r2=498(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=138(y), r7=119(width), r8=100(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 225
LDI r1, 74
LDI r2, 498
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 138
LDI r7, 119
LDI r8, 100
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
