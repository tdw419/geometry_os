; DESCRIPTION: Draws a blue line from (275, 235) to (312, 209).
; PLAN: r0=275(x1), r1=235(y1), r2=312(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 235
LDI r2, 312
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
