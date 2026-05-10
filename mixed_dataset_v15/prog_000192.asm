; DESCRIPTION: Places a green line segment connecting (123, 244) to (397, 40).
; PLAN: r0=123(x1), r1=244(y1), r2=397(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 244
LDI r2, 397
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
