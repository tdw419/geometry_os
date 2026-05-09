; DESCRIPTION: Places a green line segment connecting (397, 248) to (421, 139).
; PLAN: r0=397(x1), r1=248(y1), r2=421(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 248
LDI r2, 421
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
