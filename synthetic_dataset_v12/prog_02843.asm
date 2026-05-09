; DESCRIPTION: Places a green line segment connecting (241, 48) to (368, 248).
; PLAN: r0=241(x1), r1=48(y1), r2=368(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 48
LDI r2, 368
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
