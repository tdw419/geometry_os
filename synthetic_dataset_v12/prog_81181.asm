; DESCRIPTION: Renders a white line between points (338, 96) and (498, 181).
; PLAN: r0=338(x1), r1=96(y1), r2=498(x2), r3=181(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 96
LDI r2, 498
LDI r3, 181
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
