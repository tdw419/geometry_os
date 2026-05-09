; DESCRIPTION: Renders a white line between points (56, 233) and (181, 126).
; PLAN: r0=56(x1), r1=233(y1), r2=181(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 233
LDI r2, 181
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
