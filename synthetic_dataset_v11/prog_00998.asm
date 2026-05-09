; DESCRIPTION: Draws a purple line from (154, 199) to (54, 154).
; PLAN: r0=154(x1), r1=199(y1), r2=54(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 199
LDI r2, 54
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
