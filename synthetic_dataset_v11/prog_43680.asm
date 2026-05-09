; DESCRIPTION: Places a red line segment connecting (71, 60) to (144, 109).
; PLAN: r0=71(x1), r1=60(y1), r2=144(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 60
LDI r2, 144
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
