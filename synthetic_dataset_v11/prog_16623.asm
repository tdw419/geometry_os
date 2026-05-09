; DESCRIPTION: Draws a red line from (32, 79) to (140, 214).
; PLAN: r0=32(x1), r1=79(y1), r2=140(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 79
LDI r2, 140
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
