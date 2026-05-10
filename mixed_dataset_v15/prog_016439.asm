; DESCRIPTION: Places a green line segment connecting (241, 71) to (466, 229).
; PLAN: r0=241(x1), r1=71(y1), r2=466(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 71
LDI r2, 466
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
