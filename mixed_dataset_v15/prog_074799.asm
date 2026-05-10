; DESCRIPTION: Draws a purple line from (199, 224) to (85, 154).
; PLAN: r0=199(x1), r1=224(y1), r2=85(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 224
LDI r2, 85
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
