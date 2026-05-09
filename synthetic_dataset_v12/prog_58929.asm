; DESCRIPTION: Draws a red line from (84, 79) to (292, 128).
; PLAN: r0=84(x1), r1=79(y1), r2=292(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 79
LDI r2, 292
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
