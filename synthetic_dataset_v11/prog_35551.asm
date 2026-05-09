; DESCRIPTION: Draws a purple line from (235, 79) to (127, 37).
; PLAN: r0=235(x1), r1=79(y1), r2=127(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 79
LDI r2, 127
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
