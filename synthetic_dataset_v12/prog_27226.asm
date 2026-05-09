; DESCRIPTION: Draws a black line from (131, 28) to (467, 84).
; PLAN: r0=131(x1), r1=28(y1), r2=467(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 28
LDI r2, 467
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
