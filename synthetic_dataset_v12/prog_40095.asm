; DESCRIPTION: Draws a red line from (473, 235) to (380, 78).
; PLAN: r0=473(x1), r1=235(y1), r2=380(x2), r3=78(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 235
LDI r2, 380
LDI r3, 78
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
