; DESCRIPTION: Renders a blue line between points (149, 249) and (25, 67).
; PLAN: r0=149(x1), r1=249(y1), r2=25(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 249
LDI r2, 25
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
