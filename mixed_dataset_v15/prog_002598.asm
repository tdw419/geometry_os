; DESCRIPTION: Draws a red line from (431, 174) to (224, 216).
; PLAN: r0=431(x1), r1=174(y1), r2=224(x2), r3=216(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 174
LDI r2, 224
LDI r3, 216
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
