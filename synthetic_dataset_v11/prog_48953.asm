; DESCRIPTION: Places a white line segment connecting (207, 217) to (127, 185).
; PLAN: r0=207(x1), r1=217(y1), r2=127(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 217
LDI r2, 127
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
