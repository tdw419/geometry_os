; DESCRIPTION: Places a blue line segment connecting (25, 156) to (194, 210).
; PLAN: r0=25(x1), r1=156(y1), r2=194(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 156
LDI r2, 194
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
