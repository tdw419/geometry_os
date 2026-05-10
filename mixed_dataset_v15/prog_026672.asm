; DESCRIPTION: Places a red line segment connecting (187, 75) to (268, 100).
; PLAN: r0=187(x1), r1=75(y1), r2=268(x2), r3=100(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 75
LDI r2, 268
LDI r3, 100
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
