; DESCRIPTION: Draws a yellow line from (112, 49) to (197, 235).
; PLAN: r0=112(x1), r1=49(y1), r2=197(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 49
LDI r2, 197
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
