; DESCRIPTION: Draws a red line from (241, 134) to (265, 75).
; PLAN: r0=241(x1), r1=134(y1), r2=265(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 134
LDI r2, 265
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
