; DESCRIPTION: Renders a green line between points (158, 157) and (38, 156).
; PLAN: r0=158(x1), r1=157(y1), r2=38(x2), r3=156(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 157
LDI r2, 38
LDI r3, 156
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
