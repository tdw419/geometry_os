; DESCRIPTION: Draws a red line from (373, 35) to (64, 11).
; PLAN: r0=373(x1), r1=35(y1), r2=64(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 35
LDI r2, 64
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
