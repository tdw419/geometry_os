; DESCRIPTION: Renders a blue line between points (160, 93) and (282, 76).
; PLAN: r0=160(x1), r1=93(y1), r2=282(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 93
LDI r2, 282
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
