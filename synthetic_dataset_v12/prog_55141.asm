; DESCRIPTION: Draws a white line from (270, 254) to (224, 75).
; PLAN: r0=270(x1), r1=254(y1), r2=224(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 254
LDI r2, 224
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
