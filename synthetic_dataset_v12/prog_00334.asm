; DESCRIPTION: Renders a blue line between points (83, 75) and (307, 168).
; PLAN: r0=83(x1), r1=75(y1), r2=307(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 75
LDI r2, 307
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
