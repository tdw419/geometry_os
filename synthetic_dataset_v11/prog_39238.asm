; DESCRIPTION: Draws a blue line from (235, 78) to (26, 166).
; PLAN: r0=235(x1), r1=78(y1), r2=26(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 78
LDI r2, 26
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
