; DESCRIPTION: Places a red line segment connecting (394, 178) to (358, 5).
; PLAN: r0=394(x1), r1=178(y1), r2=358(x2), r3=5(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 178
LDI r2, 358
LDI r3, 5
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
