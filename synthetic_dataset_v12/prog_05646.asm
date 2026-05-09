; DESCRIPTION: Draws a blue line from (109, 195) to (11, 140).
; PLAN: r0=109(x1), r1=195(y1), r2=11(x2), r3=140(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 195
LDI r2, 11
LDI r3, 140
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
