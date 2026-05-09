; DESCRIPTION: Draws a red line from (156, 19) to (30, 68).
; PLAN: r0=156(x1), r1=19(y1), r2=30(x2), r3=68(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 19
LDI r2, 30
LDI r3, 68
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
