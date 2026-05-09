; DESCRIPTION: Places a red line segment connecting (458, 24) to (187, 246).
; PLAN: r0=458(x1), r1=24(y1), r2=187(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 24
LDI r2, 187
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
