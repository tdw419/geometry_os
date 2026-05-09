; DESCRIPTION: Renders a white line between points (399, 166) and (119, 187).
; PLAN: r0=399(x1), r1=166(y1), r2=119(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 166
LDI r2, 119
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
