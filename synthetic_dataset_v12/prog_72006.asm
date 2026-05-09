; DESCRIPTION: Places a blue line segment connecting (47, 97) to (429, 166).
; PLAN: r0=47(x1), r1=97(y1), r2=429(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 97
LDI r2, 429
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
