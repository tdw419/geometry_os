; DESCRIPTION: Places a blue line segment connecting (11, 69) to (384, 135).
; PLAN: r0=11(x1), r1=69(y1), r2=384(x2), r3=135(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 69
LDI r2, 384
LDI r3, 135
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
