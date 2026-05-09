; DESCRIPTION: Draws a red line from (52, 235) to (96, 67).
; PLAN: r0=52(x1), r1=235(y1), r2=96(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 235
LDI r2, 96
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
