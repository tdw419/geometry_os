; DESCRIPTION: Renders a yellow line between points (301, 22) and (149, 156).
; PLAN: r0=301(x1), r1=22(y1), r2=149(x2), r3=156(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 22
LDI r2, 149
LDI r3, 156
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
