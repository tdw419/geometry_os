; DESCRIPTION: Draws a purple line from (8, 184) to (224, 55).
; PLAN: r0=8(x1), r1=184(y1), r2=224(x2), r3=55(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 184
LDI r2, 224
LDI r3, 55
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
