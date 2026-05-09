; DESCRIPTION: Draws a black line from (19, 97) to (339, 161).
; PLAN: r0=19(x1), r1=97(y1), r2=339(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 97
LDI r2, 339
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
