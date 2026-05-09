; DESCRIPTION: Renders a white line between points (83, 157) and (114, 72).
; PLAN: r0=83(x1), r1=157(y1), r2=114(x2), r3=72(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 157
LDI r2, 114
LDI r3, 72
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
