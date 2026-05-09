; DESCRIPTION: Draws a blue line from (140, 245) to (54, 18).
; PLAN: r0=140(x1), r1=245(y1), r2=54(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 245
LDI r2, 54
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
