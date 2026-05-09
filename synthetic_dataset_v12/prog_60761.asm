; DESCRIPTION: Draws a white line from (250, 77) to (136, 1).
; PLAN: r0=250(x1), r1=77(y1), r2=136(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 77
LDI r2, 136
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
