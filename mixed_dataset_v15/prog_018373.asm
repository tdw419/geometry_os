; DESCRIPTION: Draws a white line from (283, 64) to (201, 70).
; PLAN: r0=283(x1), r1=64(y1), r2=201(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 64
LDI r2, 201
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
