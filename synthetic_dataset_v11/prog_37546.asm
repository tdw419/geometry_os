; DESCRIPTION: Places a orange line segment connecting (195, 168) to (91, 221).
; PLAN: r0=195(x1), r1=168(y1), r2=91(x2), r3=221(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 168
LDI r2, 91
LDI r3, 221
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
