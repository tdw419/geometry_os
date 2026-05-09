; DESCRIPTION: Draws a black line from (383, 18) to (39, 80).
; PLAN: r0=383(x1), r1=18(y1), r2=39(x2), r3=80(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 18
LDI r2, 39
LDI r3, 80
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
