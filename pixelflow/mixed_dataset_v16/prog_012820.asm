; DESCRIPTION: Draws a yellow line from (235, 184) to (133, 81).
; PLAN: r0=235(x1), r1=184(y1), r2=133(x2), r3=81(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 184
LDI r2, 133
LDI r3, 81
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
