; DESCRIPTION: Places a yellow line segment connecting (118, 11) to (138, 171).
; PLAN: r0=118(x1), r1=11(y1), r2=138(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 11
LDI r2, 138
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
