; DESCRIPTION: Places a blue line segment connecting (171, 78) to (397, 241).
; PLAN: r0=171(x1), r1=78(y1), r2=397(x2), r3=241(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 78
LDI r2, 397
LDI r3, 241
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
