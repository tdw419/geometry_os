; DESCRIPTION: Draws a blue line from (224, 188) to (49, 21).
; PLAN: r0=224(x1), r1=188(y1), r2=49(x2), r3=21(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 188
LDI r2, 49
LDI r3, 21
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
