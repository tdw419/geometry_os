; DESCRIPTION: Places a magenta line segment connecting (96, 84) to (362, 72).
; PLAN: r0=96(x1), r1=84(y1), r2=362(x2), r3=72(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 84
LDI r2, 362
LDI r3, 72
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
