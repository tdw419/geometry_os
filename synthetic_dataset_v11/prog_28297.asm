; DESCRIPTION: Renders a blue line between points (53, 12) and (5, 24).
; PLAN: r0=53(x1), r1=12(y1), r2=5(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 12
LDI r2, 5
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
