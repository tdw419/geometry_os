; DESCRIPTION: Places a green line segment connecting (137, 252) to (224, 125).
; PLAN: r0=137(x1), r1=252(y1), r2=224(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 252
LDI r2, 224
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
