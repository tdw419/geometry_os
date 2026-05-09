; DESCRIPTION: Renders a blue line between points (375, 109) and (124, 87).
; PLAN: r0=375(x1), r1=109(y1), r2=124(x2), r3=87(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 109
LDI r2, 124
LDI r3, 87
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
