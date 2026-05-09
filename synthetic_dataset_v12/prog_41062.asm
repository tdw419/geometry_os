; DESCRIPTION: Places a green line segment connecting (38, 86) to (323, 125).
; PLAN: r0=38(x1), r1=86(y1), r2=323(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 86
LDI r2, 323
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
