; DESCRIPTION: Draws a green line from (41, 235) to (302, 49).
; PLAN: r0=41(x1), r1=235(y1), r2=302(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 235
LDI r2, 302
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
