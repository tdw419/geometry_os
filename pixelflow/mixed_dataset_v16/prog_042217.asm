; DESCRIPTION: Draws a blue line from (135, 18) to (235, 115).
; PLAN: r0=135(x1), r1=18(y1), r2=235(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 18
LDI r2, 235
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
