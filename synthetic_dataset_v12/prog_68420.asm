; DESCRIPTION: Places a yellow line segment connecting (28, 125) to (391, 70).
; PLAN: r0=28(x1), r1=125(y1), r2=391(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 125
LDI r2, 391
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
