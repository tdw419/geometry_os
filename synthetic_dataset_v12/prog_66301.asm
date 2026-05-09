; DESCRIPTION: Draws a black line from (131, 4) to (37, 19).
; PLAN: r0=131(x1), r1=4(y1), r2=37(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 4
LDI r2, 37
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
