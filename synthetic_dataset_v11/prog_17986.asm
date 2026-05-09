; DESCRIPTION: Draws a blue line from (153, 23) to (31, 243).
; PLAN: r0=153(x1), r1=23(y1), r2=31(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 23
LDI r2, 31
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
