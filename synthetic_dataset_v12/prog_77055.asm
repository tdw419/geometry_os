; DESCRIPTION: Places a white line segment connecting (224, 81) to (129, 214).
; PLAN: r0=224(x1), r1=81(y1), r2=129(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 81
LDI r2, 129
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
