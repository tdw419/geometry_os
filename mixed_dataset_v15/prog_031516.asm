; DESCRIPTION: Places a purple line segment connecting (350, 239) to (333, 224).
; PLAN: r0=350(x1), r1=239(y1), r2=333(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 239
LDI r2, 333
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
