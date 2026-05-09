; DESCRIPTION: Places a purple line segment connecting (327, 171) to (30, 61).
; PLAN: r0=327(x1), r1=171(y1), r2=30(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 171
LDI r2, 30
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
