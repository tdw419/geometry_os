; DESCRIPTION: Draws a black line from (280, 115) to (310, 217).
; PLAN: r0=280(x1), r1=115(y1), r2=310(x2), r3=217(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 115
LDI r2, 310
LDI r3, 217
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
