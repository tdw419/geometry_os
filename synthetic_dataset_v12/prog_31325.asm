; DESCRIPTION: Renders a blue line between points (367, 168) and (204, 179).
; PLAN: r0=367(x1), r1=168(y1), r2=204(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 168
LDI r2, 204
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
