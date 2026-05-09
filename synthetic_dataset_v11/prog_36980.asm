; DESCRIPTION: Renders a blue line between points (160, 134) and (194, 57).
; PLAN: r0=160(x1), r1=134(y1), r2=194(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 134
LDI r2, 194
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
