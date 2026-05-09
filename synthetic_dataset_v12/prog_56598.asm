; DESCRIPTION: Draws a black line from (292, 142) to (7, 131).
; PLAN: r0=292(x1), r1=142(y1), r2=7(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 142
LDI r2, 7
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
