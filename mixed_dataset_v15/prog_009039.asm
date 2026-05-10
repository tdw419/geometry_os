; DESCRIPTION: Composite: Creates a yellow rectangular region at (263, 150) spanning 22 by 60 pixels then Renders a red line between points (102, 237) and (509, 216).
; PLAN: r0=263(x), r1=150(y), r2=22(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=102(x1), r6=237(y1), r7=509(x2), r8=216(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 263
LDI r1, 150
LDI r2, 22
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 102
LDI r6, 237
LDI r7, 509
LDI r8, 216
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
