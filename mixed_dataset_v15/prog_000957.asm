; DESCRIPTION: Renders a black line between points (409, 172) and (332, 73).
; PLAN: r0=409(x1), r1=172(y1), r2=332(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 172
LDI r2, 332
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
