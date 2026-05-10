; DESCRIPTION: Composite: Creates a magenta rectangular region at (345, 123) spanning 118 by 48 pixels then Renders a purple line between points (58, 192) and (309, 132).
; PLAN: r0=345(x), r1=123(y), r2=118(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=58(x1), r6=192(y1), r7=309(x2), r8=132(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 123
LDI r2, 118
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 192
LDI r7, 309
LDI r8, 132
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
