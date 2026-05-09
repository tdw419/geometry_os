; DESCRIPTION: Places a red line segment connecting (408, 19) to (334, 202).
; PLAN: r0=408(x1), r1=19(y1), r2=334(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 19
LDI r2, 334
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
