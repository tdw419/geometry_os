; DESCRIPTION: Composite: Creates a white rectangular region at (39, 25) spanning 21 by 80 pixels then Renders a purple line between points (25, 33) and (95, 114).
; PLAN: r0=39(x), r1=25(y), r2=21(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=25(x1), r6=33(y1), r7=95(x2), r8=114(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 39
LDI r1, 25
LDI r2, 21
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 33
LDI r7, 95
LDI r8, 114
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
