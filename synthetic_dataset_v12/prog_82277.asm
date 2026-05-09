; DESCRIPTION: Places a red line segment connecting (118, 33) to (144, 71).
; PLAN: r0=118(x1), r1=33(y1), r2=144(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 33
LDI r2, 144
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
