; DESCRIPTION: Renders a white line between points (144, 199) and (1, 135).
; PLAN: r0=144(x1), r1=199(y1), r2=1(x2), r3=135(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 199
LDI r2, 1
LDI r3, 135
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
