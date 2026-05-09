; DESCRIPTION: Draws a black line from (376, 223) to (224, 130).
; PLAN: r0=376(x1), r1=223(y1), r2=224(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 223
LDI r2, 224
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
