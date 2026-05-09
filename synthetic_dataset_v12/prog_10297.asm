; DESCRIPTION: Places a white line segment connecting (397, 62) to (56, 134).
; PLAN: r0=397(x1), r1=62(y1), r2=56(x2), r3=134(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 62
LDI r2, 56
LDI r3, 134
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
