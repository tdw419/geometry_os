; DESCRIPTION: Draws a blue line from (250, 235) to (160, 84).
; PLAN: r0=250(x1), r1=235(y1), r2=160(x2), r3=84(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 235
LDI r2, 160
LDI r3, 84
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
