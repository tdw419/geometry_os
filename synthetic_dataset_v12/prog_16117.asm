; DESCRIPTION: Places a green line segment connecting (277, 57) to (429, 87).
; PLAN: r0=277(x1), r1=57(y1), r2=429(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 57
LDI r2, 429
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
