; DESCRIPTION: Renders a blue line between points (299, 207) and (384, 78).
; PLAN: r0=299(x1), r1=207(y1), r2=384(x2), r3=78(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 207
LDI r2, 384
LDI r3, 78
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
