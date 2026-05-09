; DESCRIPTION: Places a green line segment connecting (141, 138) to (141, 179).
; PLAN: r0=141(x1), r1=138(y1), r2=141(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 138
LDI r2, 141
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
