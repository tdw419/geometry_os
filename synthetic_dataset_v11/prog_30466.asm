; DESCRIPTION: Places a black line segment connecting (51, 154) to (246, 132).
; PLAN: r0=51(x1), r1=154(y1), r2=246(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 154
LDI r2, 246
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
