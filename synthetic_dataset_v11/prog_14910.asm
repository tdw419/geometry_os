; DESCRIPTION: Places a purple line segment connecting (209, 42) to (51, 106).
; PLAN: r0=209(x1), r1=42(y1), r2=51(x2), r3=106(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 42
LDI r2, 51
LDI r3, 106
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
