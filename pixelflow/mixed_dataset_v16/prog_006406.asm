; DESCRIPTION: Draws a magenta line from (49, 235) to (326, 191).
; PLAN: r0=49(x1), r1=235(y1), r2=326(x2), r3=191(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 235
LDI r2, 326
LDI r3, 191
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
