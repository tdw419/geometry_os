; DESCRIPTION: Draws a black line from (203, 147) to (112, 210).
; PLAN: r0=203(x1), r1=147(y1), r2=112(x2), r3=210(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 147
LDI r2, 112
LDI r3, 210
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
