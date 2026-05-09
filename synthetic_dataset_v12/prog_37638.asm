; DESCRIPTION: Places a magenta line segment connecting (493, 121) to (421, 162).
; PLAN: r0=493(x1), r1=121(y1), r2=421(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 121
LDI r2, 421
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
