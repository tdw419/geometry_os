; DESCRIPTION: Draws a yellow line from (343, 235) to (285, 150).
; PLAN: r0=343(x1), r1=235(y1), r2=285(x2), r3=150(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 235
LDI r2, 285
LDI r3, 150
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
