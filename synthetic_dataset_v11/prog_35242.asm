; DESCRIPTION: Renders a purple line between points (198, 244) and (37, 154).
; PLAN: r0=198(x1), r1=244(y1), r2=37(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 244
LDI r2, 37
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
