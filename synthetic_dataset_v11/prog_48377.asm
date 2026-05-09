; DESCRIPTION: Draws a black line from (103, 199) to (33, 43).
; PLAN: r0=103(x1), r1=199(y1), r2=33(x2), r3=43(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 199
LDI r2, 33
LDI r3, 43
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
