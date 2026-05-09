; DESCRIPTION: Draws a blue line from (486, 91) to (235, 240).
; PLAN: r0=486(x1), r1=91(y1), r2=235(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 91
LDI r2, 235
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
