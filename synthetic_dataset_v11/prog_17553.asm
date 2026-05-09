; DESCRIPTION: Draws a black line from (49, 58) to (132, 43).
; PLAN: r0=49(x1), r1=58(y1), r2=132(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 58
LDI r2, 132
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
