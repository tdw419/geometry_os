; DESCRIPTION: Renders a blue line between points (109, 193) and (397, 19).
; PLAN: r0=109(x1), r1=193(y1), r2=397(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 193
LDI r2, 397
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
