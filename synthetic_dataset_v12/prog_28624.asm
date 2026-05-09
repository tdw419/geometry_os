; DESCRIPTION: Draws a red line from (189, 121) to (70, 81).
; PLAN: r0=189(x1), r1=121(y1), r2=70(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 121
LDI r2, 70
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
