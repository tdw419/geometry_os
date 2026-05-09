; DESCRIPTION: Renders a blue line between points (197, 120) and (487, 136).
; PLAN: r0=197(x1), r1=120(y1), r2=487(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 120
LDI r2, 487
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
