; DESCRIPTION: Draws a white line from (2, 10) to (116, 81).
; PLAN: r0=2(x1), r1=10(y1), r2=116(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 10
LDI r2, 116
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
