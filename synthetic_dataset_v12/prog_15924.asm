; DESCRIPTION: Places a green line segment connecting (306, 140) to (336, 24).
; PLAN: r0=306(x1), r1=140(y1), r2=336(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 140
LDI r2, 336
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
