; DESCRIPTION: Places a green line segment connecting (399, 236) to (353, 220).
; PLAN: r0=399(x1), r1=236(y1), r2=353(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 236
LDI r2, 353
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
