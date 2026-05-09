; DESCRIPTION: Renders a white line between points (498, 88) and (427, 209).
; PLAN: r0=498(x1), r1=88(y1), r2=427(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 88
LDI r2, 427
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
