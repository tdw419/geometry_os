; DESCRIPTION: Places a red line segment connecting (27, 134) to (31, 109).
; PLAN: r0=27(x1), r1=134(y1), r2=31(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 134
LDI r2, 31
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
