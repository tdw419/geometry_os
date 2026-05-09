; DESCRIPTION: Places a red line segment connecting (280, 87) to (432, 182).
; PLAN: r0=280(x1), r1=87(y1), r2=432(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 87
LDI r2, 432
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
