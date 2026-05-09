; DESCRIPTION: Composite: Creates a yellow rectangular region at (321, 199) spanning 48 by 25 pixels then Places a red line segment connecting (422, 30) to (172, 119).
; PLAN: r0=321(x), r1=199(y), r2=48(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x1), r6=30(y1), r7=172(x2), r8=119(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 199
LDI r2, 48
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 30
LDI r7, 172
LDI r8, 119
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
