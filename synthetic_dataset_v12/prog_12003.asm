; DESCRIPTION: Draws a black line from (494, 49) to (0, 115).
; PLAN: r0=494(x1), r1=49(y1), r2=0(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 49
LDI r2, 0
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
