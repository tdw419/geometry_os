; DESCRIPTION: Draws a magenta line from (217, 235) to (141, 119).
; PLAN: r0=217(x1), r1=235(y1), r2=141(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 235
LDI r2, 141
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
