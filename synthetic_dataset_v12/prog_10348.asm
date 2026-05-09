; DESCRIPTION: Places a yellow line segment connecting (59, 95) to (397, 48).
; PLAN: r0=59(x1), r1=95(y1), r2=397(x2), r3=48(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 95
LDI r2, 397
LDI r3, 48
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
