; DESCRIPTION: Draws a white line from (235, 219) to (251, 22).
; PLAN: r0=235(x1), r1=219(y1), r2=251(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 219
LDI r2, 251
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
