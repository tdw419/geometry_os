; DESCRIPTION: Renders a green line between points (370, 252) and (507, 66).
; PLAN: r0=370(x1), r1=252(y1), r2=507(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 252
LDI r2, 507
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
