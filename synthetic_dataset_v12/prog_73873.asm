; DESCRIPTION: Places a blue line segment connecting (368, 63) to (179, 138).
; PLAN: r0=368(x1), r1=63(y1), r2=179(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 63
LDI r2, 179
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
