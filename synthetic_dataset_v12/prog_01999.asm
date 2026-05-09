; DESCRIPTION: Draws a orange line from (224, 211) to (45, 43).
; PLAN: r0=224(x1), r1=211(y1), r2=45(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 211
LDI r2, 45
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
