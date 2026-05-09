; DESCRIPTION: Draws a black line from (366, 113) to (474, 56).
; PLAN: r0=366(x1), r1=113(y1), r2=474(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 113
LDI r2, 474
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
