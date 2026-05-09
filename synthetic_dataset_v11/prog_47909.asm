; DESCRIPTION: Places a red line segment connecting (234, 116) to (179, 208).
; PLAN: r0=234(x1), r1=116(y1), r2=179(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 116
LDI r2, 179
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
