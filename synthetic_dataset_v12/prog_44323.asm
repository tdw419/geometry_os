; DESCRIPTION: Composite: Creates a black rectangular region at (112, 22) spanning 99 by 71 pixels then Draws a red line from (2, 177) to (341, 168).
; PLAN: r0=112(x), r1=22(y), r2=99(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=2(x1), r6=177(y1), r7=341(x2), r8=168(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 22
LDI r2, 99
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 2
LDI r6, 177
LDI r7, 341
LDI r8, 168
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
