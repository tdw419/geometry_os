; DESCRIPTION: Places a red line segment connecting (397, 5) to (155, 254).
; PLAN: r0=397(x1), r1=5(y1), r2=155(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 5
LDI r2, 155
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
