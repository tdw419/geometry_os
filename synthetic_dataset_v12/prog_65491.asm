; DESCRIPTION: Places a red line segment connecting (484, 234) to (397, 177).
; PLAN: r0=484(x1), r1=234(y1), r2=397(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 234
LDI r2, 397
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
