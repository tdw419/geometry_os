; DESCRIPTION: Draws a blue line from (224, 70) to (6, 144).
; PLAN: r0=224(x1), r1=70(y1), r2=6(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 70
LDI r2, 6
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
