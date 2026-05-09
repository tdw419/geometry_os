; DESCRIPTION: Renders a white line between points (457, 132) and (472, 56).
; PLAN: r0=457(x1), r1=132(y1), r2=472(x2), r3=56(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 132
LDI r2, 472
LDI r3, 56
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
