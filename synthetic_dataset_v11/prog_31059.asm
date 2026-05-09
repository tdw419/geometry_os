; DESCRIPTION: Renders a blue line between points (5, 131) and (85, 103).
; PLAN: r0=5(x1), r1=131(y1), r2=85(x2), r3=103(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 131
LDI r2, 85
LDI r3, 103
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
