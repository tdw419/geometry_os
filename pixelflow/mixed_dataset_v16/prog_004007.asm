; DESCRIPTION: Composite: Draws a purple line from (157, 137) to (403, 93) then Creates a white rectangular region at (334, 106) spanning 23 by 20 pixels.
; PLAN: r0=157(x1), r1=137(y1), r2=403(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=106(y), r7=23(width), r8=20(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 137
LDI r2, 403
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 106
LDI r7, 23
LDI r8, 20
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
