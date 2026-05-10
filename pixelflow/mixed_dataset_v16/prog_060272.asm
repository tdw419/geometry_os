; DESCRIPTION: Draws a blue line from (34, 109) to (75, 235).
; PLAN: r0=34(x1), r1=109(y1), r2=75(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 109
LDI r2, 75
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
