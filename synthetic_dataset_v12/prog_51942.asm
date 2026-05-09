; DESCRIPTION: Draws a yellow line from (196, 235) to (395, 72).
; PLAN: r0=196(x1), r1=235(y1), r2=395(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 235
LDI r2, 395
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
