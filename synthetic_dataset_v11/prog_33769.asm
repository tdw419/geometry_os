; DESCRIPTION: Places a black line segment connecting (128, 120) to (84, 79).
; PLAN: r0=128(x1), r1=120(y1), r2=84(x2), r3=79(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 120
LDI r2, 84
LDI r3, 79
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
