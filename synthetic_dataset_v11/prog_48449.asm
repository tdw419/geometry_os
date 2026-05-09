; DESCRIPTION: Places a green line segment connecting (120, 227) to (215, 158).
; PLAN: r0=120(x1), r1=227(y1), r2=215(x2), r3=158(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 227
LDI r2, 215
LDI r3, 158
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
