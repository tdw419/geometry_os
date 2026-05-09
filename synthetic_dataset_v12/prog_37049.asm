; DESCRIPTION: Places a yellow line segment connecting (78, 70) to (397, 121).
; PLAN: r0=78(x1), r1=70(y1), r2=397(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 70
LDI r2, 397
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
