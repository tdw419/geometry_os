; DESCRIPTION: Draws a white line from (352, 235) to (182, 20).
; PLAN: r0=352(x1), r1=235(y1), r2=182(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 235
LDI r2, 182
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
