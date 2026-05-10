; DESCRIPTION: Renders a white line segment connecting (160, 171) to (204, 130).
; PLAN: r0=160(x1), r1=171(y1), r2=204(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 171
LDI r2, 204
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
