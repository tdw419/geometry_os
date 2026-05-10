; DESCRIPTION: Renders a blue line between points (120, 76) and (265, 172).
; PLAN: r0=120(x1), r1=76(y1), r2=265(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 76
LDI r2, 265
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
