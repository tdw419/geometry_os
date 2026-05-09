; DESCRIPTION: Draws a black line from (250, 70) to (291, 80).
; PLAN: r0=250(x1), r1=70(y1), r2=291(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 70
LDI r2, 291
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
