; DESCRIPTION: Renders a orange line between points (464, 114) and (486, 208).
; PLAN: r0=464(x1), r1=114(y1), r2=486(x2), r3=208(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 114
LDI r2, 486
LDI r3, 208
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
