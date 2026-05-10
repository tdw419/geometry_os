; DESCRIPTION: Places a blue line segment connecting (36, 138) to (226, 156).
; PLAN: r0=36(x1), r1=138(y1), r2=226(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 138
LDI r2, 226
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
