; DESCRIPTION: Composite: Draws a purple line from (509, 168) to (508, 26) then Creates a magenta rectangular region at (288, 101) spanning 62 by 30 pixels.
; PLAN: r0=509(x1), r1=168(y1), r2=508(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=101(y), r7=62(width), r8=30(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 509
LDI r1, 168
LDI r2, 508
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 101
LDI r7, 62
LDI r8, 30
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
