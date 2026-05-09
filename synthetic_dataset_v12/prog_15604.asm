; DESCRIPTION: Draws a red line from (272, 121) to (43, 89).
; PLAN: r0=272(x1), r1=121(y1), r2=43(x2), r3=89(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 121
LDI r2, 43
LDI r3, 89
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
