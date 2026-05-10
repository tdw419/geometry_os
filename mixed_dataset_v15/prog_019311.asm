; DESCRIPTION: Draws a red line from (250, 165) to (354, 133).
; PLAN: r0=250(x1), r1=165(y1), r2=354(x2), r3=133(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 165
LDI r2, 354
LDI r3, 133
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
