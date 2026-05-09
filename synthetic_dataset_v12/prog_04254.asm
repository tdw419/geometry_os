; DESCRIPTION: Places a orange line segment connecting (377, 112) to (479, 88).
; PLAN: r0=377(x1), r1=112(y1), r2=479(x2), r3=88(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 112
LDI r2, 479
LDI r3, 88
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
