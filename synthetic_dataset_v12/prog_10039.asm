; DESCRIPTION: Draws a purple line from (368, 37) to (125, 235).
; PLAN: r0=368(x1), r1=37(y1), r2=125(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 37
LDI r2, 125
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
