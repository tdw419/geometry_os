; DESCRIPTION: Places a magenta line segment connecting (157, 43) to (53, 133).
; PLAN: r0=157(x1), r1=43(y1), r2=53(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 43
LDI r2, 53
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
