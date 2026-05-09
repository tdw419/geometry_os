; DESCRIPTION: Renders a blue line between points (83, 125) and (82, 67).
; PLAN: r0=83(x1), r1=125(y1), r2=82(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 125
LDI r2, 82
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
