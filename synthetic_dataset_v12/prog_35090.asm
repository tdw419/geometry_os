; DESCRIPTION: Places a red line segment connecting (75, 169) to (275, 246).
; PLAN: r0=75(x1), r1=169(y1), r2=275(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 169
LDI r2, 275
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
