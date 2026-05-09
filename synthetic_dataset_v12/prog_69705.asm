; DESCRIPTION: Renders a blue line between points (18, 50) and (277, 131).
; PLAN: r0=18(x1), r1=50(y1), r2=277(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 50
LDI r2, 277
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
