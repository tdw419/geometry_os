; DESCRIPTION: Draws a black line from (24, 17) to (131, 196).
; PLAN: r0=24(x1), r1=17(y1), r2=131(x2), r3=196(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 17
LDI r2, 131
LDI r3, 196
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
