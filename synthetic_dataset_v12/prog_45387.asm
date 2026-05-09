; DESCRIPTION: Renders a blue line between points (293, 112) and (392, 148).
; PLAN: r0=293(x1), r1=112(y1), r2=392(x2), r3=148(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 112
LDI r2, 392
LDI r3, 148
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
