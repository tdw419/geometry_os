; DESCRIPTION: Draws a black line from (76, 88) to (40, 139).
; PLAN: r0=76(x1), r1=88(y1), r2=40(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 88
LDI r2, 40
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
