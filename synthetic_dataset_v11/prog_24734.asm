; DESCRIPTION: Draws a black line from (143, 50) to (122, 118).
; PLAN: r0=143(x1), r1=50(y1), r2=122(x2), r3=118(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 50
LDI r2, 122
LDI r3, 118
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
