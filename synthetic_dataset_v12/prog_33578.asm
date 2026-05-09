; DESCRIPTION: Renders a orange line between points (464, 196) and (265, 43).
; PLAN: r0=464(x1), r1=196(y1), r2=265(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 196
LDI r2, 265
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
