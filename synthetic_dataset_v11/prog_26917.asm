; DESCRIPTION: Draws a black line from (2, 85) to (209, 89).
; PLAN: r0=2(x1), r1=85(y1), r2=209(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 85
LDI r2, 209
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
