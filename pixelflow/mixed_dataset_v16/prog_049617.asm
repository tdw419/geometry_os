; DESCRIPTION: Renders a purple line segment connecting (212, 128) to (97, 154).
; PLAN: r0=212(x1), r1=128(y1), r2=97(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 128
LDI r2, 97
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
