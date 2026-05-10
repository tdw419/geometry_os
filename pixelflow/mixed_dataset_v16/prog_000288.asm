; DESCRIPTION: Places a green line segment connecting (157, 81) to (335, 120).
; PLAN: r0=157(x1), r1=81(y1), r2=335(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 81
LDI r2, 335
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
