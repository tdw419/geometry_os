; DESCRIPTION: Draws a green line from (337, 106) to (19, 235).
; PLAN: r0=337(x1), r1=106(y1), r2=19(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 106
LDI r2, 19
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
