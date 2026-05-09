; DESCRIPTION: Draws a orange line from (165, 233) to (57, 179).
; PLAN: r0=165(x1), r1=233(y1), r2=57(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 233
LDI r2, 57
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
