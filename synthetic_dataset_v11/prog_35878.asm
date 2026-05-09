; DESCRIPTION: Places a red line segment connecting (168, 148) to (250, 114).
; PLAN: r0=168(x1), r1=148(y1), r2=250(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 148
LDI r2, 250
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
