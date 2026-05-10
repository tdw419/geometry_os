; DESCRIPTION: Draws a blue line from (18, 139) to (286, 9).
; PLAN: r0=18(x1), r1=139(y1), r2=286(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 139
LDI r2, 286
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
