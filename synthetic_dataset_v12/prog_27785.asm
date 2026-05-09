; DESCRIPTION: Renders a blue line between points (57, 31) and (433, 67).
; PLAN: r0=57(x1), r1=31(y1), r2=433(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 31
LDI r2, 433
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
