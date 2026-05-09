; DESCRIPTION: Renders a yellow line between points (3, 174) and (161, 179).
; PLAN: r0=3(x1), r1=174(y1), r2=161(x2), r3=179(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 174
LDI r2, 161
LDI r3, 179
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
