; DESCRIPTION: Draws a white line from (6, 184) to (74, 135).
; PLAN: r0=6(x1), r1=184(y1), r2=74(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 184
LDI r2, 74
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
