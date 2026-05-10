; DESCRIPTION: Draws a red line from (165, 76) to (65, 63).
; PLAN: r0=165(x1), r1=76(y1), r2=65(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 76
LDI r2, 65
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
