; DESCRIPTION: Draws a red line from (350, 88) to (219, 185).
; PLAN: r0=350(x1), r1=88(y1), r2=219(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 88
LDI r2, 219
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
