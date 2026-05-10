; DESCRIPTION: Renders a white line between points (287, 111) and (33, 130).
; PLAN: r0=287(x1), r1=111(y1), r2=33(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 111
LDI r2, 33
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
