; DESCRIPTION: Draws a black line from (120, 43) to (138, 217).
; PLAN: r0=120(x1), r1=43(y1), r2=138(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 43
LDI r2, 138
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
