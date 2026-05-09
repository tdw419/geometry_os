; DESCRIPTION: Renders a green line between points (76, 200) and (102, 186).
; PLAN: r0=76(x1), r1=200(y1), r2=102(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 200
LDI r2, 102
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
