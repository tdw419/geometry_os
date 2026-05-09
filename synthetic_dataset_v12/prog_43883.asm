; DESCRIPTION: Draws a yellow line from (378, 87) to (158, 154).
; PLAN: r0=378(x1), r1=87(y1), r2=158(x2), r3=154(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 87
LDI r2, 158
LDI r3, 154
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
