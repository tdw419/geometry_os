; DESCRIPTION: Renders a black line between points (8, 7) and (457, 56).
; PLAN: r0=8(x1), r1=7(y1), r2=457(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 7
LDI r2, 457
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
