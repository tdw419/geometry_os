; DESCRIPTION: Draws a orange line from (74, 235) to (342, 117).
; PLAN: r0=74(x1), r1=235(y1), r2=342(x2), r3=117(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 235
LDI r2, 342
LDI r3, 117
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
