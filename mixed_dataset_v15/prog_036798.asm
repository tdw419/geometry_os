; DESCRIPTION: Draws a white line from (49, 235) to (182, 207).
; PLAN: r0=49(x1), r1=235(y1), r2=182(x2), r3=207(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 235
LDI r2, 182
LDI r3, 207
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
