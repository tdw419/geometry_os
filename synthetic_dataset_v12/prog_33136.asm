; DESCRIPTION: Places a white line segment connecting (455, 250) to (154, 191).
; PLAN: r0=455(x1), r1=250(y1), r2=154(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 250
LDI r2, 154
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
