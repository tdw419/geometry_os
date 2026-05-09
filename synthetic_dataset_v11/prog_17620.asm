; DESCRIPTION: Draws a black line from (18, 86) to (61, 179).
; PLAN: r0=18(x1), r1=86(y1), r2=61(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 86
LDI r2, 61
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
