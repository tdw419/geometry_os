; DESCRIPTION: Places a white line segment connecting (28, 187) to (13, 52).
; PLAN: r0=28(x1), r1=187(y1), r2=13(x2), r3=52(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 187
LDI r2, 13
LDI r3, 52
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
