; DESCRIPTION: Draws a red line from (166, 156) to (437, 237).
; PLAN: r0=166(x1), r1=156(y1), r2=437(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 156
LDI r2, 437
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
