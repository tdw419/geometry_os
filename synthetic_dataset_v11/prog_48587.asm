; DESCRIPTION: Renders a white line between points (5, 66) and (114, 160).
; PLAN: r0=5(x1), r1=66(y1), r2=114(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 66
LDI r2, 114
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
