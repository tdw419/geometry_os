; DESCRIPTION: Places a red line segment connecting (331, 234) to (93, 126).
; PLAN: r0=331(x1), r1=234(y1), r2=93(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 234
LDI r2, 93
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
