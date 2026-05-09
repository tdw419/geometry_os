; DESCRIPTION: Places a red line segment connecting (411, 234) to (191, 126).
; PLAN: r0=411(x1), r1=234(y1), r2=191(x2), r3=126(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 234
LDI r2, 191
LDI r3, 126
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
