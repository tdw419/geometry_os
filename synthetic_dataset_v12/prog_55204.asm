; DESCRIPTION: Composite: Places a purple line segment connecting (328, 169) to (497, 120) then Creates a purple rectangular region at (140, 25) spanning 95 by 93 pixels.
; PLAN: r0=328(x1), r1=169(y1), r2=497(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=140(x), r6=25(y), r7=95(width), r8=93(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 169
LDI r2, 497
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 25
LDI r7, 95
LDI r8, 93
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
