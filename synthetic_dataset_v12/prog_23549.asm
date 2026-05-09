; DESCRIPTION: Places a blue line segment connecting (182, 39) to (179, 58).
; PLAN: r0=182(x1), r1=39(y1), r2=179(x2), r3=58(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 39
LDI r2, 179
LDI r3, 58
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
