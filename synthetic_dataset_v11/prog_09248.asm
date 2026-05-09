; DESCRIPTION: Places a magenta line segment connecting (195, 41) to (148, 132).
; PLAN: r0=195(x1), r1=41(y1), r2=148(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 41
LDI r2, 148
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
