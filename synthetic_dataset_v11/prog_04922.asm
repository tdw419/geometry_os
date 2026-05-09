; DESCRIPTION: Draws a white line from (224, 199) to (163, 144).
; PLAN: r0=224(x1), r1=199(y1), r2=163(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 199
LDI r2, 163
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
