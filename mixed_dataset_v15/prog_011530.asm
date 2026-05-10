; DESCRIPTION: Places a magenta line segment connecting (387, 151) to (481, 22).
; PLAN: r0=387(x1), r1=151(y1), r2=481(x2), r3=22(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 151
LDI r2, 481
LDI r3, 22
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
