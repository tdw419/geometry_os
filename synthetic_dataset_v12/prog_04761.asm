; DESCRIPTION: Draws a blue line from (185, 245) to (195, 216).
; PLAN: r0=185(x1), r1=245(y1), r2=195(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 245
LDI r2, 195
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
