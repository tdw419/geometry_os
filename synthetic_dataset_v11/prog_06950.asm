; DESCRIPTION: Renders a purple line between points (168, 254) and (10, 157).
; PLAN: r0=168(x1), r1=254(y1), r2=10(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 254
LDI r2, 10
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
