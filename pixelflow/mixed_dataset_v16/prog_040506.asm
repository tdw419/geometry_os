; DESCRIPTION: Draws a green line from (22, 170) to (52, 30).
; PLAN: r0=22(x1), r1=170(y1), r2=52(x2), r3=30(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 170
LDI r2, 52
LDI r3, 30
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
