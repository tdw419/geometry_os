; DESCRIPTION: Places a blue line segment connecting (164, 25) to (97, 182).
; PLAN: r0=164(x1), r1=25(y1), r2=97(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 25
LDI r2, 97
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
