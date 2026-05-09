; DESCRIPTION: Places a magenta line segment connecting (53, 91) to (51, 40).
; PLAN: r0=53(x1), r1=91(y1), r2=51(x2), r3=40(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 91
LDI r2, 51
LDI r3, 40
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
