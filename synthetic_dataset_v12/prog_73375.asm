; DESCRIPTION: Renders a orange line between points (208, 105) and (267, 6).
; PLAN: r0=208(x1), r1=105(y1), r2=267(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 105
LDI r2, 267
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
