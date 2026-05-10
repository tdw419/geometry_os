; DESCRIPTION: Draws a magenta line from (415, 112) to (41, 211).
; PLAN: r0=415(x1), r1=112(y1), r2=41(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 112
LDI r2, 41
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
