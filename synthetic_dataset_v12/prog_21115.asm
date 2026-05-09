; DESCRIPTION: Places a green line segment connecting (109, 186) to (17, 221).
; PLAN: r0=109(x1), r1=186(y1), r2=17(x2), r3=221(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 186
LDI r2, 17
LDI r3, 221
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
