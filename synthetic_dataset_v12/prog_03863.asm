; DESCRIPTION: Places a green line segment connecting (11, 188) to (224, 154).
; PLAN: r0=11(x1), r1=188(y1), r2=224(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 188
LDI r2, 224
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
