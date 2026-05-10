; DESCRIPTION: Places a magenta line segment connecting (96, 135) to (511, 0).
; PLAN: r0=96(x1), r1=135(y1), r2=511(x2), r3=0(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 135
LDI r2, 511
LDI r3, 0
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
