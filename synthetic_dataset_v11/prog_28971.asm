; DESCRIPTION: Places a red line segment connecting (69, 51) to (179, 66).
; PLAN: r0=69(x1), r1=51(y1), r2=179(x2), r3=66(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 51
LDI r2, 179
LDI r3, 66
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
