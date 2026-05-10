; DESCRIPTION: Renders a green line between points (153, 145) and (226, 98).
; PLAN: r0=153(x1), r1=145(y1), r2=226(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 145
LDI r2, 226
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
