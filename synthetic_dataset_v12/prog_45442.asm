; DESCRIPTION: Draws a yellow line from (39, 79) to (430, 235).
; PLAN: r0=39(x1), r1=79(y1), r2=430(x2), r3=235(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 79
LDI r2, 430
LDI r3, 235
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
