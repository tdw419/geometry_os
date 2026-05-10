; DESCRIPTION: Draws a red line from (224, 219) to (210, 145).
; PLAN: r0=224(x1), r1=219(y1), r2=210(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 219
LDI r2, 210
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
