; DESCRIPTION: Draws a yellow line from (119, 72) to (312, 174).
; PLAN: r0=119(x1), r1=72(y1), r2=312(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 72
LDI r2, 312
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
