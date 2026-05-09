; DESCRIPTION: Draws a blue line from (33, 245) to (107, 80).
; PLAN: r0=33(x1), r1=245(y1), r2=107(x2), r3=80(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 245
LDI r2, 107
LDI r3, 80
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
