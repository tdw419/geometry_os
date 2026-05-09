; DESCRIPTION: Places a white line segment connecting (106, 35) to (220, 203).
; PLAN: r0=106(x1), r1=35(y1), r2=220(x2), r3=203(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 35
LDI r2, 220
LDI r3, 203
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
