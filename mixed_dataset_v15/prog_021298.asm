; DESCRIPTION: Renders a blue line between points (26, 168) and (276, 17).
; PLAN: r0=26(x1), r1=168(y1), r2=276(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 168
LDI r2, 276
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
