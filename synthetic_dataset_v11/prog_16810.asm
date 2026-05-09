; DESCRIPTION: Renders a green line between points (181, 157) and (11, 123).
; PLAN: r0=181(x1), r1=157(y1), r2=11(x2), r3=123(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 157
LDI r2, 11
LDI r3, 123
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
