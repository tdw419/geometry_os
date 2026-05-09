; DESCRIPTION: Draws a blue line from (88, 76) to (73, 91).
; PLAN: r0=88(x1), r1=76(y1), r2=73(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 76
LDI r2, 73
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
