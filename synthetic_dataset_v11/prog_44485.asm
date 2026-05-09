; DESCRIPTION: Draws a red line from (95, 10) to (113, 75).
; PLAN: r0=95(x1), r1=10(y1), r2=113(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 10
LDI r2, 113
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
