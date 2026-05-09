; DESCRIPTION: Draws a white line from (119, 136) to (106, 135).
; PLAN: r0=119(x1), r1=136(y1), r2=106(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 136
LDI r2, 106
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
