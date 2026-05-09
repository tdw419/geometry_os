; DESCRIPTION: Draws a red line from (27, 26) to (79, 24).
; PLAN: r0=27(x1), r1=26(y1), r2=79(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 26
LDI r2, 79
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
