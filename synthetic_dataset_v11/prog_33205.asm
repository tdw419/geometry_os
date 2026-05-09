; DESCRIPTION: Places a green line segment connecting (100, 121) to (130, 120).
; PLAN: r0=100(x1), r1=121(y1), r2=130(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 121
LDI r2, 130
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
