; DESCRIPTION: Draws a black line from (72, 150) to (338, 121).
; PLAN: r0=72(x1), r1=150(y1), r2=338(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 150
LDI r2, 338
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
