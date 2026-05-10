; DESCRIPTION: Renders a green line between points (142, 243) and (158, 108).
; PLAN: r0=142(x1), r1=243(y1), r2=158(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 243
LDI r2, 158
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
