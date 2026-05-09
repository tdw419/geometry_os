; DESCRIPTION: Places a red line segment connecting (288, 244) to (397, 133).
; PLAN: r0=288(x1), r1=244(y1), r2=397(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 244
LDI r2, 397
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
