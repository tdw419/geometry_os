; DESCRIPTION: Draws a yellow line from (179, 73) to (70, 235).
; PLAN: r0=179(x1), r1=73(y1), r2=70(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 73
LDI r2, 70
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
