; DESCRIPTION: Places a green line segment connecting (174, 217) to (459, 212).
; PLAN: r0=174(x1), r1=217(y1), r2=459(x2), r3=212(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 217
LDI r2, 459
LDI r3, 212
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
