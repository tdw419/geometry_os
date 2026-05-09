; DESCRIPTION: Renders a green line between points (196, 34) and (81, 149).
; PLAN: r0=196(x1), r1=34(y1), r2=81(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 34
LDI r2, 81
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
