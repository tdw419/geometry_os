; DESCRIPTION: Places a blue line segment connecting (192, 134) to (224, 215).
; PLAN: r0=192(x1), r1=134(y1), r2=224(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 134
LDI r2, 224
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
