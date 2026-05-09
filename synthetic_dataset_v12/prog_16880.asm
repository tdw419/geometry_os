; DESCRIPTION: Draws a black line from (393, 6) to (223, 121).
; PLAN: r0=393(x1), r1=6(y1), r2=223(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 6
LDI r2, 223
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
