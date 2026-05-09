; DESCRIPTION: Places a green line segment connecting (158, 125) to (100, 195).
; PLAN: r0=158(x1), r1=125(y1), r2=100(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 125
LDI r2, 100
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
