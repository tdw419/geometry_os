; DESCRIPTION: Draws a red line from (61, 43) to (151, 114).
; PLAN: r0=61(x1), r1=43(y1), r2=151(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 43
LDI r2, 151
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
