; DESCRIPTION: Composite: Renders a red line between points (440, 16) and (141, 147) then Creates a blue rectangular region at (321, 15) spanning 60 by 95 pixels.
; PLAN: r0=440(x1), r1=16(y1), r2=141(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=15(y), r7=60(width), r8=95(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 16
LDI r2, 141
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 15
LDI r7, 60
LDI r8, 95
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
