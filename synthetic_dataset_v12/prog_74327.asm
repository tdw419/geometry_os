; DESCRIPTION: Draws a red line from (460, 115) to (3, 74).
; PLAN: r0=460(x1), r1=115(y1), r2=3(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 115
LDI r2, 3
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
