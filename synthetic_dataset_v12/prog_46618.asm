; DESCRIPTION: Places a black line segment connecting (371, 60) to (493, 160).
; PLAN: r0=371(x1), r1=60(y1), r2=493(x2), r3=160(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 60
LDI r2, 493
LDI r3, 160
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
