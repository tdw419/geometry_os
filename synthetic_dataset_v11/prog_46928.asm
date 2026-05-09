; DESCRIPTION: Draws a black line from (12, 189) to (179, 234).
; PLAN: r0=12(x1), r1=189(y1), r2=179(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 189
LDI r2, 179
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
