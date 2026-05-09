; DESCRIPTION: Places a purple line segment connecting (407, 223) to (178, 115).
; PLAN: r0=407(x1), r1=223(y1), r2=178(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 223
LDI r2, 178
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
