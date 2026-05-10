; DESCRIPTION: Draws a purple line from (224, 40) to (363, 32).
; PLAN: r0=224(x1), r1=40(y1), r2=363(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 40
LDI r2, 363
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
