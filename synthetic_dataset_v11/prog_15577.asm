; DESCRIPTION: Renders a blue line between points (79, 34) and (125, 48).
; PLAN: r0=79(x1), r1=34(y1), r2=125(x2), r3=48(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 34
LDI r2, 125
LDI r3, 48
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
