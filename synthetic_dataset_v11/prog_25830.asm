; DESCRIPTION: Places a black line segment connecting (183, 0) to (217, 229).
; PLAN: r0=183(x1), r1=0(y1), r2=217(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 0
LDI r2, 217
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
