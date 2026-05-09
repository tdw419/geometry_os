; DESCRIPTION: Draws a black line from (100, 98) to (77, 184).
; PLAN: r0=100(x1), r1=98(y1), r2=77(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 98
LDI r2, 77
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
