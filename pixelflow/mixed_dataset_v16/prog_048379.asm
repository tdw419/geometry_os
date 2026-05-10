; DESCRIPTION: Places a white line segment connecting (455, 188) to (270, 122).
; PLAN: r0=455(x1), r1=188(y1), r2=270(x2), r3=122(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 188
LDI r2, 270
LDI r3, 122
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
