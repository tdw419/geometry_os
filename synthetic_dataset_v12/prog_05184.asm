; DESCRIPTION: Draws a red line from (332, 143) to (382, 75).
; PLAN: r0=332(x1), r1=143(y1), r2=382(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 143
LDI r2, 382
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
