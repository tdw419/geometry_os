; DESCRIPTION: Places a orange line segment connecting (209, 197) to (314, 82).
; PLAN: r0=209(x1), r1=197(y1), r2=314(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 197
LDI r2, 314
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
