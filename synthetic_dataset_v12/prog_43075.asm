; DESCRIPTION: Places a green line segment connecting (397, 168) to (192, 60).
; PLAN: r0=397(x1), r1=168(y1), r2=192(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 168
LDI r2, 192
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
