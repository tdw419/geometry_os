; DESCRIPTION: Places a red line segment connecting (251, 76) to (27, 212).
; PLAN: r0=251(x1), r1=76(y1), r2=27(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 76
LDI r2, 27
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
