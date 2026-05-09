; DESCRIPTION: Draws a black line from (179, 32) to (75, 181).
; PLAN: r0=179(x1), r1=32(y1), r2=75(x2), r3=181(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 32
LDI r2, 75
LDI r3, 181
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
