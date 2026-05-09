; DESCRIPTION: Draws a blue line from (496, 213) to (412, 80).
; PLAN: r0=496(x1), r1=213(y1), r2=412(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 213
LDI r2, 412
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
