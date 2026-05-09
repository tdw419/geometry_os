; DESCRIPTION: Draws a magenta line from (97, 40) to (77, 235).
; PLAN: r0=97(x1), r1=40(y1), r2=77(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 40
LDI r2, 77
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
