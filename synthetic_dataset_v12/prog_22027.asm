; DESCRIPTION: Renders a white line between points (37, 24) and (137, 171).
; PLAN: r0=37(x1), r1=24(y1), r2=137(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 24
LDI r2, 137
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
