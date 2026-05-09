; DESCRIPTION: Places a green line segment connecting (493, 144) to (349, 237).
; PLAN: r0=493(x1), r1=144(y1), r2=349(x2), r3=237(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 144
LDI r2, 349
LDI r3, 237
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
