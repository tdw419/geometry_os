; DESCRIPTION: Draws a purple line from (131, 3) to (224, 209).
; PLAN: r0=131(x1), r1=3(y1), r2=224(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 3
LDI r2, 224
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
