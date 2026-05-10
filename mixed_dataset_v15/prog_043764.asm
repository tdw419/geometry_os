; DESCRIPTION: Draws a black line from (121, 217) to (478, 195).
; PLAN: r0=121(x1), r1=217(y1), r2=478(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 217
LDI r2, 478
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
