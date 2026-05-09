; DESCRIPTION: Places a green line segment connecting (286, 2) to (107, 220).
; PLAN: r0=286(x1), r1=2(y1), r2=107(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 2
LDI r2, 107
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
