; DESCRIPTION: Renders a white line between points (422, 66) and (384, 69).
; PLAN: r0=422(x1), r1=66(y1), r2=384(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 66
LDI r2, 384
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
