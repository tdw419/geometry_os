; DESCRIPTION: Renders a orange line between points (175, 79) and (81, 48).
; PLAN: r0=175(x1), r1=79(y1), r2=81(x2), r3=48(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 79
LDI r2, 81
LDI r3, 48
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
