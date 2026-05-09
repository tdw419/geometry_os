; DESCRIPTION: Composite: Places a purple line segment connecting (381, 202) to (120, 77) then Creates a black rectangular region at (220, 186) spanning 110 by 19 pixels.
; PLAN: r0=381(x1), r1=202(y1), r2=120(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=186(y), r7=110(width), r8=19(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 202
LDI r2, 120
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 186
LDI r7, 110
LDI r8, 19
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
