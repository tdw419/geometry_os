; DESCRIPTION: Renders a yellow line between points (188, 179) and (63, 76).
; PLAN: r0=188(x1), r1=179(y1), r2=63(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 179
LDI r2, 63
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
