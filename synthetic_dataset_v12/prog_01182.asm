; DESCRIPTION: Places a green line segment connecting (363, 142) to (84, 143).
; PLAN: r0=363(x1), r1=142(y1), r2=84(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 142
LDI r2, 84
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
