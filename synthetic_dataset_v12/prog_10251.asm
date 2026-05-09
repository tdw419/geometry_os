; DESCRIPTION: Renders a green line between points (158, 181) and (135, 83).
; PLAN: r0=158(x1), r1=181(y1), r2=135(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 181
LDI r2, 135
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
