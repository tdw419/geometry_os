; DESCRIPTION: Renders a blue line between points (397, 234) and (97, 94).
; PLAN: r0=397(x1), r1=234(y1), r2=97(x2), r3=94(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 234
LDI r2, 97
LDI r3, 94
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
