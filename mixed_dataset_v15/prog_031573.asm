; DESCRIPTION: Draws a red line from (459, 7) to (138, 246).
; PLAN: r0=459(x1), r1=7(y1), r2=138(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 7
LDI r2, 138
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
