; DESCRIPTION: Draws a black line from (27, 179) to (18, 61).
; PLAN: r0=27(x1), r1=179(y1), r2=18(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 179
LDI r2, 18
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
