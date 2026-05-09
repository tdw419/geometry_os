; DESCRIPTION: Draws a white line from (7, 155) to (101, 238).
; PLAN: r0=7(x1), r1=155(y1), r2=101(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 155
LDI r2, 101
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
