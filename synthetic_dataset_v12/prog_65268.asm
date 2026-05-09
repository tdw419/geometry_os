; DESCRIPTION: Places a green line segment connecting (86, 34) to (30, 30).
; PLAN: r0=86(x1), r1=34(y1), r2=30(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 34
LDI r2, 30
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
