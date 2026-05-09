; DESCRIPTION: Renders a blue line between points (122, 216) and (10, 195).
; PLAN: r0=122(x1), r1=216(y1), r2=10(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 216
LDI r2, 10
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
