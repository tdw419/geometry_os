; DESCRIPTION: Composite: Creates a green rectangular region at (413, 10) spanning 46 by 100 pixels then Renders a purple line between points (332, 40) and (68, 71).
; PLAN: r0=413(x), r1=10(y), r2=46(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x1), r6=40(y1), r7=68(x2), r8=71(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 10
LDI r2, 46
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 40
LDI r7, 68
LDI r8, 71
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
