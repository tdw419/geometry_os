; DESCRIPTION: Draws a red line from (433, 203) to (39, 156).
; PLAN: r0=433(x1), r1=203(y1), r2=39(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 203
LDI r2, 39
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
