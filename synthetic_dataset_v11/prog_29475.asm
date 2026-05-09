; DESCRIPTION: Renders a white line between points (134, 108) and (130, 66).
; PLAN: r0=134(x1), r1=108(y1), r2=130(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 108
LDI r2, 130
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
