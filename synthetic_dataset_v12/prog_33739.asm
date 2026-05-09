; DESCRIPTION: Draws a black line from (370, 252) to (429, 102).
; PLAN: r0=370(x1), r1=252(y1), r2=429(x2), r3=102(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 252
LDI r2, 429
LDI r3, 102
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
