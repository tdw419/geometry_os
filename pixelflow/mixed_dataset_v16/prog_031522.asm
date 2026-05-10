; DESCRIPTION: Draws a orange line from (165, 6) to (224, 209).
; PLAN: r0=165(x1), r1=6(y1), r2=224(x2), r3=209(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 6
LDI r2, 224
LDI r3, 209
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
