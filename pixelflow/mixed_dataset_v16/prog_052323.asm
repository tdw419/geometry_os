; DESCRIPTION: Draws a white line from (224, 155) to (462, 77).
; PLAN: r0=224(x1), r1=155(y1), r2=462(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 155
LDI r2, 462
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
