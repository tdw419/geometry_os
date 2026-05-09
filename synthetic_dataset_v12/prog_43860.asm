; DESCRIPTION: Draws a red line from (248, 177) to (72, 156).
; PLAN: r0=248(x1), r1=177(y1), r2=72(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 177
LDI r2, 72
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
