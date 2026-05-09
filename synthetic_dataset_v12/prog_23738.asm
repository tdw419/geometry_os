; DESCRIPTION: Composite: Draws a magenta circle centered at (169, 67) with radius 36 then Draws a purple line from (463, 90) to (445, 176).
; PLAN: r0=169(x), r1=67(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x1), r6=90(y1), r7=445(x2), r8=176(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 67
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 90
LDI r7, 445
LDI r8, 176
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
