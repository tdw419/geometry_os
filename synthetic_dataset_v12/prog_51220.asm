; DESCRIPTION: Places a blue line segment connecting (260, 28) to (361, 157).
; PLAN: r0=260(x1), r1=28(y1), r2=361(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 28
LDI r2, 361
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
