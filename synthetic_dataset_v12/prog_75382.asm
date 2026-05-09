; DESCRIPTION: Renders a blue line between points (184, 124) and (426, 194).
; PLAN: r0=184(x1), r1=124(y1), r2=426(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 124
LDI r2, 426
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
