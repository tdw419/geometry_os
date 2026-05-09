; DESCRIPTION: Draws a red line from (319, 35) to (81, 73).
; PLAN: r0=319(x1), r1=35(y1), r2=81(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 35
LDI r2, 81
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
