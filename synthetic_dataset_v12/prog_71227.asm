; DESCRIPTION: Renders a white line between points (153, 66) and (281, 78).
; PLAN: r0=153(x1), r1=66(y1), r2=281(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 66
LDI r2, 281
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
