; DESCRIPTION: Places a white line segment connecting (161, 156) to (107, 197).
; PLAN: r0=161(x1), r1=156(y1), r2=107(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 156
LDI r2, 107
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
