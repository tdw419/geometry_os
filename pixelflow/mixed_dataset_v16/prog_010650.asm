; DESCRIPTION: Renders a blue line between points (101, 93) and (196, 131).
; PLAN: r0=101(x1), r1=93(y1), r2=196(x2), r3=131(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 93
LDI r2, 196
LDI r3, 131
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
