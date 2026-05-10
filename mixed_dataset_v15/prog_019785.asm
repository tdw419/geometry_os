; DESCRIPTION: Composite: Creates a purple rectangular region at (336, 107) spanning 111 by 100 pixels then Renders a purple line between points (332, 106) and (482, 63).
; PLAN: r0=336(x), r1=107(y), r2=111(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x1), r6=106(y1), r7=482(x2), r8=63(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 336
LDI r1, 107
LDI r2, 111
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 106
LDI r7, 482
LDI r8, 63
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
