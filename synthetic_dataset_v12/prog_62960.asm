; DESCRIPTION: Places a green line segment connecting (491, 208) to (229, 61).
; PLAN: r0=491(x1), r1=208(y1), r2=229(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 208
LDI r2, 229
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
