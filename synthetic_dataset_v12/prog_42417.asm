; DESCRIPTION: Draws a black line from (302, 126) to (348, 89).
; PLAN: r0=302(x1), r1=126(y1), r2=348(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 126
LDI r2, 348
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
