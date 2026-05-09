; DESCRIPTION: Draws a black line from (66, 121) to (179, 117).
; PLAN: r0=66(x1), r1=121(y1), r2=179(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 121
LDI r2, 179
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
