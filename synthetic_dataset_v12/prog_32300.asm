; DESCRIPTION: Draws a black line from (10, 43) to (397, 14).
; PLAN: r0=10(x1), r1=43(y1), r2=397(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 43
LDI r2, 397
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
