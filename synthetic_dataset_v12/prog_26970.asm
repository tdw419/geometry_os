; DESCRIPTION: Draws a black line from (235, 135) to (102, 105).
; PLAN: r0=235(x1), r1=135(y1), r2=102(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 135
LDI r2, 102
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
