; DESCRIPTION: Renders a purple line between points (282, 248) and (87, 154).
; PLAN: r0=282(x1), r1=248(y1), r2=87(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 248
LDI r2, 87
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
