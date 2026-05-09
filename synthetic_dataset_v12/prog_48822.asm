; DESCRIPTION: Renders a white line between points (93, 43) and (250, 84).
; PLAN: r0=93(x1), r1=43(y1), r2=250(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 43
LDI r2, 250
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
