; DESCRIPTION: Places a purple line segment connecting (368, 224) to (176, 125).
; PLAN: r0=368(x1), r1=224(y1), r2=176(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 224
LDI r2, 176
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
