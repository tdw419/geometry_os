; DESCRIPTION: Renders a white line between points (56, 79) and (175, 43).
; PLAN: r0=56(x1), r1=79(y1), r2=175(x2), r3=43(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 79
LDI r2, 175
LDI r3, 43
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
