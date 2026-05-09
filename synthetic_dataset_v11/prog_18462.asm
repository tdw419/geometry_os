; DESCRIPTION: Draws a yellow line from (235, 223) to (28, 105).
; PLAN: r0=235(x1), r1=223(y1), r2=28(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 223
LDI r2, 28
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
