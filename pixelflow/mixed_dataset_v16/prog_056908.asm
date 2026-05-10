; DESCRIPTION: Draws a black line from (249, 39) to (97, 241).
; PLAN: r0=249(x1), r1=39(y1), r2=97(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 39
LDI r2, 97
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
