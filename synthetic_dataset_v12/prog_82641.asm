; DESCRIPTION: Draws a black line from (177, 197) to (475, 4).
; PLAN: r0=177(x1), r1=197(y1), r2=475(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 197
LDI r2, 475
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
