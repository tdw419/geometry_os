; DESCRIPTION: Draws a black line from (230, 57) to (230, 95).
; PLAN: r0=230(x1), r1=57(y1), r2=230(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 57
LDI r2, 230
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
