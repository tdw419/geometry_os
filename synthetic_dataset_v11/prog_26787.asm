; DESCRIPTION: Draws a blue line from (224, 191) to (13, 205).
; PLAN: r0=224(x1), r1=191(y1), r2=13(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 191
LDI r2, 13
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
