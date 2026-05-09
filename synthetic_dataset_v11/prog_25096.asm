; DESCRIPTION: Draws a blue line from (65, 114) to (39, 201).
; PLAN: r0=65(x1), r1=114(y1), r2=39(x2), r3=201(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 114
LDI r2, 39
LDI r3, 201
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
