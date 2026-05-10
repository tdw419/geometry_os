; DESCRIPTION: Places a green line segment connecting (297, 163) to (211, 186).
; PLAN: r0=297(x1), r1=163(y1), r2=211(x2), r3=186(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 163
LDI r2, 211
LDI r3, 186
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
