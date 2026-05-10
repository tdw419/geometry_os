; DESCRIPTION: Places a magenta line segment connecting (61, 18) to (481, 196).
; PLAN: r0=61(x1), r1=18(y1), r2=481(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 18
LDI r2, 481
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
