; DESCRIPTION: Places a white line segment connecting (379, 73) to (397, 95).
; PLAN: r0=379(x1), r1=73(y1), r2=397(x2), r3=95(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 73
LDI r2, 397
LDI r3, 95
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
