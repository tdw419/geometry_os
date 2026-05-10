; DESCRIPTION: Draws a black line from (19, 34) to (33, 217).
; PLAN: r0=19(x1), r1=34(y1), r2=33(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 34
LDI r2, 33
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
