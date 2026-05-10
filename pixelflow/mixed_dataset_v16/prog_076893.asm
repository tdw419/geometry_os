; DESCRIPTION: Places a magenta line segment connecting (320, 34) to (397, 119).
; PLAN: r0=320(x1), r1=34(y1), r2=397(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 34
LDI r2, 397
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
