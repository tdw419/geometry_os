; DESCRIPTION: Places a red line segment connecting (90, 109) to (176, 193).
; PLAN: r0=90(x1), r1=109(y1), r2=176(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 109
LDI r2, 176
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
