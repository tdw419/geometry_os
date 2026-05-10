; DESCRIPTION: Places a magenta line segment connecting (397, 61) to (47, 16).
; PLAN: r0=397(x1), r1=61(y1), r2=47(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 61
LDI r2, 47
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
