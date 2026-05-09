; DESCRIPTION: Draws a blue line from (44, 63) to (28, 157).
; PLAN: r0=44(x1), r1=63(y1), r2=28(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 63
LDI r2, 28
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
