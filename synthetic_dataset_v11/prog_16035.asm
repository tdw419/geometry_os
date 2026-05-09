; DESCRIPTION: Renders a yellow line between points (243, 156) and (244, 158).
; PLAN: r0=243(x1), r1=156(y1), r2=244(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 156
LDI r2, 244
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
