; DESCRIPTION: Places a green line segment connecting (34, 60) to (333, 44).
; PLAN: r0=34(x1), r1=60(y1), r2=333(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 60
LDI r2, 333
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
