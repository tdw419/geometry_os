; DESCRIPTION: Places a white line segment connecting (323, 103) to (397, 169).
; PLAN: r0=323(x1), r1=103(y1), r2=397(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 103
LDI r2, 397
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
