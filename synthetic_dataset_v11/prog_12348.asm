; DESCRIPTION: Renders a blue line between points (184, 120) and (80, 21).
; PLAN: r0=184(x1), r1=120(y1), r2=80(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 120
LDI r2, 80
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
