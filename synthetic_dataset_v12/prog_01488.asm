; DESCRIPTION: Places a green line segment connecting (429, 108) to (174, 105).
; PLAN: r0=429(x1), r1=108(y1), r2=174(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 108
LDI r2, 174
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
