; DESCRIPTION: Draws a black line from (179, 87) to (121, 19).
; PLAN: r0=179(x1), r1=87(y1), r2=121(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 87
LDI r2, 121
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
