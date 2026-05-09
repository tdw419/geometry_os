; DESCRIPTION: Places a red line segment connecting (294, 71) to (486, 172).
; PLAN: r0=294(x1), r1=71(y1), r2=486(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 71
LDI r2, 486
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
