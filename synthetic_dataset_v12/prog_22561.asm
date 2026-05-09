; DESCRIPTION: Renders a blue line between points (281, 248) and (427, 154).
; PLAN: r0=281(x1), r1=248(y1), r2=427(x2), r3=154(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 248
LDI r2, 427
LDI r3, 154
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
