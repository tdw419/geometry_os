; DESCRIPTION: Draws a black line from (462, 132) to (458, 45).
; PLAN: r0=462(x1), r1=132(y1), r2=458(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 132
LDI r2, 458
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
