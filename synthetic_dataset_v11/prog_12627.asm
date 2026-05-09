; DESCRIPTION: Renders a white line between points (72, 114) and (165, 232).
; PLAN: r0=72(x1), r1=114(y1), r2=165(x2), r3=232(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 114
LDI r2, 165
LDI r3, 232
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
