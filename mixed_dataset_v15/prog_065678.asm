; DESCRIPTION: Draws a black line from (65, 206) to (325, 138).
; PLAN: r0=65(x1), r1=206(y1), r2=325(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 206
LDI r2, 325
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
