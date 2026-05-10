; DESCRIPTION: Places a green line segment connecting (397, 188) to (408, 223).
; PLAN: r0=397(x1), r1=188(y1), r2=408(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 188
LDI r2, 408
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
