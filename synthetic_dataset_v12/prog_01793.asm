; DESCRIPTION: Draws a black line from (282, 20) to (376, 164).
; PLAN: r0=282(x1), r1=20(y1), r2=376(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 20
LDI r2, 376
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
