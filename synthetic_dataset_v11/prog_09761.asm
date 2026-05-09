; DESCRIPTION: Renders a blue line between points (18, 67) and (191, 134).
; PLAN: r0=18(x1), r1=67(y1), r2=191(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 67
LDI r2, 191
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
