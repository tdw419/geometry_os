; DESCRIPTION: Draws a black line from (249, 174) to (154, 155).
; PLAN: r0=249(x1), r1=174(y1), r2=154(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 174
LDI r2, 154
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
