; DESCRIPTION: Draws a red line from (178, 153) to (107, 250).
; PLAN: r0=178(x1), r1=153(y1), r2=107(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 153
LDI r2, 107
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
