; DESCRIPTION: Draws a white line from (240, 170) to (134, 91).
; PLAN: r0=240(x1), r1=170(y1), r2=134(x2), r3=91(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 170
LDI r2, 134
LDI r3, 91
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
