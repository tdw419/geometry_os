; DESCRIPTION: Renders a purple line between points (371, 38) and (183, 154).
; PLAN: r0=371(x1), r1=38(y1), r2=183(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 38
LDI r2, 183
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
