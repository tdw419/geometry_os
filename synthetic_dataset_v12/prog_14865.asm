; DESCRIPTION: Draws a blue line from (34, 88) to (386, 139).
; PLAN: r0=34(x1), r1=88(y1), r2=386(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 88
LDI r2, 386
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
