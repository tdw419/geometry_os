; DESCRIPTION: Draws a black line from (131, 50) to (420, 96).
; PLAN: r0=131(x1), r1=50(y1), r2=420(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 50
LDI r2, 420
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
