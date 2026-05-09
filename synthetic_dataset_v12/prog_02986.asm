; DESCRIPTION: Draws a black line from (236, 190) to (449, 115).
; PLAN: r0=236(x1), r1=190(y1), r2=449(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 190
LDI r2, 449
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
