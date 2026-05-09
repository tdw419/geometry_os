; DESCRIPTION: Places a red line segment connecting (138, 249) to (177, 183).
; PLAN: r0=138(x1), r1=249(y1), r2=177(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 249
LDI r2, 177
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
