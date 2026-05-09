; DESCRIPTION: Draws a red line from (57, 253) to (136, 98).
; PLAN: r0=57(x1), r1=253(y1), r2=136(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 253
LDI r2, 136
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
