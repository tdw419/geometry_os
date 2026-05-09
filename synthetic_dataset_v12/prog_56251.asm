; DESCRIPTION: Places a white line segment connecting (151, 45) to (9, 60).
; PLAN: r0=151(x1), r1=45(y1), r2=9(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 45
LDI r2, 9
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
