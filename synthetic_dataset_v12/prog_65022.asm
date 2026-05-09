; DESCRIPTION: Places a white line segment connecting (310, 127) to (440, 203).
; PLAN: r0=310(x1), r1=127(y1), r2=440(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 127
LDI r2, 440
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
