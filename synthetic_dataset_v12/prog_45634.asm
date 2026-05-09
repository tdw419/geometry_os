; DESCRIPTION: Draws a black line from (281, 19) to (361, 25).
; PLAN: r0=281(x1), r1=19(y1), r2=361(x2), r3=25(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 19
LDI r2, 361
LDI r3, 25
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
