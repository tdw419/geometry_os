; DESCRIPTION: Renders a blue line between points (194, 74) and (33, 207).
; PLAN: r0=194(x1), r1=74(y1), r2=33(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 74
LDI r2, 33
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
