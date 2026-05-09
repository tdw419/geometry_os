; DESCRIPTION: Places a green line segment connecting (197, 121) to (100, 97).
; PLAN: r0=197(x1), r1=121(y1), r2=100(x2), r3=97(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 121
LDI r2, 100
LDI r3, 97
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
