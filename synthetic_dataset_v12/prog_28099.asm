; DESCRIPTION: Renders a blue line between points (433, 104) and (324, 168).
; PLAN: r0=433(x1), r1=104(y1), r2=324(x2), r3=168(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 104
LDI r2, 324
LDI r3, 168
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
