; DESCRIPTION: Places a blue line segment connecting (352, 73) to (101, 158).
; PLAN: r0=352(x1), r1=73(y1), r2=101(x2), r3=158(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 73
LDI r2, 101
LDI r3, 158
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
