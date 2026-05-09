; DESCRIPTION: Places a magenta line segment connecting (57, 236) to (224, 147).
; PLAN: r0=57(x1), r1=236(y1), r2=224(x2), r3=147(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 236
LDI r2, 224
LDI r3, 147
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
