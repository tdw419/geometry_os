; DESCRIPTION: Draws a orange line from (20, 122) to (224, 61).
; PLAN: r0=20(x1), r1=122(y1), r2=224(x2), r3=61(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 122
LDI r2, 224
LDI r3, 61
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
