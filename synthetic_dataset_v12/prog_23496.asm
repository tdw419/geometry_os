; DESCRIPTION: Places a blue line segment connecting (182, 140) to (136, 177).
; PLAN: r0=182(x1), r1=140(y1), r2=136(x2), r3=177(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 140
LDI r2, 136
LDI r3, 177
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
