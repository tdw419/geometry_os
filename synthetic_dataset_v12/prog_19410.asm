; DESCRIPTION: Draws a black line from (141, 125) to (167, 135).
; PLAN: r0=141(x1), r1=125(y1), r2=167(x2), r3=135(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 125
LDI r2, 167
LDI r3, 135
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
