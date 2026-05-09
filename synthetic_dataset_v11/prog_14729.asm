; DESCRIPTION: Draws a magenta line from (19, 235) to (230, 251).
; PLAN: r0=19(x1), r1=235(y1), r2=230(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 235
LDI r2, 230
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
