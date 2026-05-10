; DESCRIPTION: Draws a red line from (268, 198) to (297, 115).
; PLAN: r0=268(x1), r1=198(y1), r2=297(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 198
LDI r2, 297
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
