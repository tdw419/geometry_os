; DESCRIPTION: Draws a red line from (240, 250) to (85, 214).
; PLAN: r0=240(x1), r1=250(y1), r2=85(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 250
LDI r2, 85
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
