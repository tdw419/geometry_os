; DESCRIPTION: Draws a green line from (366, 235) to (348, 18).
; PLAN: r0=366(x1), r1=235(y1), r2=348(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 235
LDI r2, 348
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
