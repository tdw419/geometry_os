; DESCRIPTION: Places a white line segment connecting (51, 1) to (224, 14).
; PLAN: r0=51(x1), r1=1(y1), r2=224(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 1
LDI r2, 224
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
