; DESCRIPTION: Places a red line segment connecting (153, 177) to (51, 70).
; PLAN: r0=153(x1), r1=177(y1), r2=51(x2), r3=70(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 177
LDI r2, 51
LDI r3, 70
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
