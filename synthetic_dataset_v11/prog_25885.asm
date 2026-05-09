; DESCRIPTION: Renders a blue line between points (73, 67) and (176, 10).
; PLAN: r0=73(x1), r1=67(y1), r2=176(x2), r3=10(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 67
LDI r2, 176
LDI r3, 10
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
