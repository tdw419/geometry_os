; DESCRIPTION: Draws a black line from (235, 181) to (283, 202).
; PLAN: r0=235(x1), r1=181(y1), r2=283(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 181
LDI r2, 283
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
