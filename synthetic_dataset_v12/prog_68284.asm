; DESCRIPTION: Draws a black line from (361, 107) to (216, 74).
; PLAN: r0=361(x1), r1=107(y1), r2=216(x2), r3=74(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 107
LDI r2, 216
LDI r3, 74
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
