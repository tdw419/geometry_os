; DESCRIPTION: Renders a white line between points (7, 63) and (122, 81).
; PLAN: r0=7(x1), r1=63(y1), r2=122(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 63
LDI r2, 122
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
