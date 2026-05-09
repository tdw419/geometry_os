; DESCRIPTION: Places a magenta line segment connecting (250, 10) to (362, 182).
; PLAN: r0=250(x1), r1=10(y1), r2=362(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 10
LDI r2, 362
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
