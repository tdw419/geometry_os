; DESCRIPTION: Draws a blue line from (224, 62) to (61, 136).
; PLAN: r0=224(x1), r1=62(y1), r2=61(x2), r3=136(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 62
LDI r2, 61
LDI r3, 136
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
