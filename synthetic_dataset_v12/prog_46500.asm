; DESCRIPTION: Renders a blue line between points (18, 195) and (385, 152).
; PLAN: r0=18(x1), r1=195(y1), r2=385(x2), r3=152(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 195
LDI r2, 385
LDI r3, 152
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
