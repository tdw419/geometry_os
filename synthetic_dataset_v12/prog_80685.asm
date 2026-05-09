; DESCRIPTION: Composite: Creates a red rectangular region at (381, 72) spanning 10 by 49 pixels then Renders a purple line between points (422, 188) and (92, 102).
; PLAN: r0=381(x), r1=72(y), r2=10(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x1), r6=188(y1), r7=92(x2), r8=102(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 72
LDI r2, 10
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 188
LDI r7, 92
LDI r8, 102
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
