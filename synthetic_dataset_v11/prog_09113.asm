; DESCRIPTION: Renders a green line between points (14, 25) and (149, 7).
; PLAN: r0=14(x1), r1=25(y1), r2=149(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 25
LDI r2, 149
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
