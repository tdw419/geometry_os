; DESCRIPTION: Draws a white line from (453, 110) to (228, 136).
; PLAN: r0=453(x1), r1=110(y1), r2=228(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 110
LDI r2, 228
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
