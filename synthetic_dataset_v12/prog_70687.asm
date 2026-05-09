; DESCRIPTION: Draws a purple line from (465, 21) to (472, 235).
; PLAN: r0=465(x1), r1=21(y1), r2=472(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 21
LDI r2, 472
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
