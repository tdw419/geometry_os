; DESCRIPTION: Draws a red line from (164, 5) to (178, 232).
; PLAN: r0=164(x1), r1=5(y1), r2=178(x2), r3=232(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 5
LDI r2, 178
LDI r3, 232
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
