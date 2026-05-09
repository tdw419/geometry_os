; DESCRIPTION: Places a magenta line segment connecting (374, 138) to (53, 19).
; PLAN: r0=374(x1), r1=138(y1), r2=53(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 138
LDI r2, 53
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
