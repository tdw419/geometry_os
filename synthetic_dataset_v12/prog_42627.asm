; DESCRIPTION: Places a black line segment connecting (335, 157) to (262, 189).
; PLAN: r0=335(x1), r1=157(y1), r2=262(x2), r3=189(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 157
LDI r2, 262
LDI r3, 189
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
