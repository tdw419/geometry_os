; DESCRIPTION: Draws a blue line from (224, 35) to (224, 69).
; PLAN: r0=224(x1), r1=35(y1), r2=224(x2), r3=69(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 35
LDI r2, 224
LDI r3, 69
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
