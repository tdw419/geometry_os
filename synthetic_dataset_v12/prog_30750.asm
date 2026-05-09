; DESCRIPTION: Draws a blue line from (455, 18) to (77, 139).
; PLAN: r0=455(x1), r1=18(y1), r2=77(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 18
LDI r2, 77
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
