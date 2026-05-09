; DESCRIPTION: Draws a purple line from (223, 133) to (18, 235).
; PLAN: r0=223(x1), r1=133(y1), r2=18(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 133
LDI r2, 18
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
