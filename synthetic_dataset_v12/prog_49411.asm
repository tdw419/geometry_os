; DESCRIPTION: Draws a white line from (224, 87) to (329, 149).
; PLAN: r0=224(x1), r1=87(y1), r2=329(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 87
LDI r2, 329
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
