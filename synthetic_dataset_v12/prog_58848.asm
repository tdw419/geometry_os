; DESCRIPTION: Draws a black line from (143, 51) to (230, 218).
; PLAN: r0=143(x1), r1=51(y1), r2=230(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 51
LDI r2, 230
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
