; DESCRIPTION: Draws a black line from (361, 60) to (10, 180).
; PLAN: r0=361(x1), r1=60(y1), r2=10(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 60
LDI r2, 10
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
