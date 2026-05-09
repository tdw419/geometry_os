; DESCRIPTION: Composite: Creates a blue rectangular region at (37, 109) spanning 103 by 118 pixels then Renders a purple line between points (267, 167) and (190, 193).
; PLAN: r0=37(x), r1=109(y), r2=103(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=267(x1), r6=167(y1), r7=190(x2), r8=193(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 37
LDI r1, 109
LDI r2, 103
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 267
LDI r6, 167
LDI r7, 190
LDI r8, 193
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
