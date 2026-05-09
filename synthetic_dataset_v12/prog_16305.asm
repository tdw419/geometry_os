; DESCRIPTION: Draws a white line from (293, 57) to (224, 58).
; PLAN: r0=293(x1), r1=57(y1), r2=224(x2), r3=58(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 57
LDI r2, 224
LDI r3, 58
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
