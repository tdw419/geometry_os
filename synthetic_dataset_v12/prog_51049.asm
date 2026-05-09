; DESCRIPTION: Draws a blue line from (511, 56) to (226, 84).
; PLAN: r0=511(x1), r1=56(y1), r2=226(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 56
LDI r2, 226
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
