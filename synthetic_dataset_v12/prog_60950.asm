; DESCRIPTION: Renders a blue line between points (383, 0) and (109, 98).
; PLAN: r0=383(x1), r1=0(y1), r2=109(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 0
LDI r2, 109
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
