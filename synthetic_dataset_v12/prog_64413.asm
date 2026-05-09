; DESCRIPTION: Draws a green line from (426, 41) to (447, 98).
; PLAN: r0=426(x1), r1=41(y1), r2=447(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 41
LDI r2, 447
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
