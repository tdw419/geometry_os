; DESCRIPTION: Renders a blue line between points (113, 50) and (179, 201).
; PLAN: r0=113(x1), r1=50(y1), r2=179(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 50
LDI r2, 179
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
