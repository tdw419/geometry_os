; DESCRIPTION: Places a green line segment connecting (365, 89) to (101, 101).
; PLAN: r0=365(x1), r1=89(y1), r2=101(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 89
LDI r2, 101
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
