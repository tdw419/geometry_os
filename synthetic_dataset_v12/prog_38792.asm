; DESCRIPTION: Draws a black line from (344, 119) to (167, 81).
; PLAN: r0=344(x1), r1=119(y1), r2=167(x2), r3=81(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 119
LDI r2, 167
LDI r3, 81
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
