; DESCRIPTION: Draws a black line from (366, 131) to (80, 224).
; PLAN: r0=366(x1), r1=131(y1), r2=80(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 131
LDI r2, 80
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
