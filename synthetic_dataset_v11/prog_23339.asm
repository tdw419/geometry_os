; DESCRIPTION: Places a green line segment connecting (71, 115) to (241, 148).
; PLAN: r0=71(x1), r1=115(y1), r2=241(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 115
LDI r2, 241
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
