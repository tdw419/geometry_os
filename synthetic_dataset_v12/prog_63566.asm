; DESCRIPTION: Places a green line segment connecting (353, 0) to (272, 52).
; PLAN: r0=353(x1), r1=0(y1), r2=272(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 0
LDI r2, 272
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
