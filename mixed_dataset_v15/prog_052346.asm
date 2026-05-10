; DESCRIPTION: Places a red line segment connecting (159, 101) to (397, 183).
; PLAN: r0=159(x1), r1=101(y1), r2=397(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 101
LDI r2, 397
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
