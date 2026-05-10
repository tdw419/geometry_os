; DESCRIPTION: Renders a white line between points (233, 69) and (490, 204).
; PLAN: r0=233(x1), r1=69(y1), r2=490(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 69
LDI r2, 490
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
