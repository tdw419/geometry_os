; DESCRIPTION: Places a green line segment connecting (166, 53) to (229, 50).
; PLAN: r0=166(x1), r1=53(y1), r2=229(x2), r3=50(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 53
LDI r2, 229
LDI r3, 50
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
