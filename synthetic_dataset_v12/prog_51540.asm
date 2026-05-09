; DESCRIPTION: Renders a green line between points (161, 145) and (37, 238).
; PLAN: r0=161(x1), r1=145(y1), r2=37(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 145
LDI r2, 37
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
