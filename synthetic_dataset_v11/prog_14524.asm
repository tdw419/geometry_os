; DESCRIPTION: Renders a white line between points (43, 172) and (129, 108).
; PLAN: r0=43(x1), r1=172(y1), r2=129(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 172
LDI r2, 129
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
