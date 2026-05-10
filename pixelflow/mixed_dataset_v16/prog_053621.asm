; DESCRIPTION: Places a magenta line segment connecting (481, 157) to (388, 112).
; PLAN: r0=481(x1), r1=157(y1), r2=388(x2), r3=112(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 157
LDI r2, 388
LDI r3, 112
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
