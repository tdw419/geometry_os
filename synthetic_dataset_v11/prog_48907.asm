; DESCRIPTION: Draws a black line from (166, 135) to (132, 89).
; PLAN: r0=166(x1), r1=135(y1), r2=132(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 135
LDI r2, 132
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
