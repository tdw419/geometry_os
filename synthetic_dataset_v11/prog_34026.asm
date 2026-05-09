; DESCRIPTION: Draws a black line from (48, 222) to (235, 105).
; PLAN: r0=48(x1), r1=222(y1), r2=235(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 222
LDI r2, 235
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
