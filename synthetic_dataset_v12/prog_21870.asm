; DESCRIPTION: Places a red line segment connecting (26, 138) to (22, 177).
; PLAN: r0=26(x1), r1=138(y1), r2=22(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 138
LDI r2, 22
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
