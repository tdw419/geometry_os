; DESCRIPTION: Draws a red line from (28, 82) to (441, 6).
; PLAN: r0=28(x1), r1=82(y1), r2=441(x2), r3=6(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 82
LDI r2, 441
LDI r3, 6
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
