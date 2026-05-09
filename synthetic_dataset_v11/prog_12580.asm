; DESCRIPTION: Renders a white line between points (227, 166) and (241, 237).
; PLAN: r0=227(x1), r1=166(y1), r2=241(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 166
LDI r2, 241
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
