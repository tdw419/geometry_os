; DESCRIPTION: Places a red line segment connecting (144, 165) to (75, 124).
; PLAN: r0=144(x1), r1=165(y1), r2=75(x2), r3=124(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 165
LDI r2, 75
LDI r3, 124
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
