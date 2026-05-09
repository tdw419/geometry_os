; DESCRIPTION: Renders a green line between points (226, 125) and (194, 1).
; PLAN: r0=226(x1), r1=125(y1), r2=194(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 125
LDI r2, 194
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
