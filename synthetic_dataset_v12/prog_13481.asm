; DESCRIPTION: Places a white line segment connecting (129, 19) to (204, 197).
; PLAN: r0=129(x1), r1=19(y1), r2=204(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 19
LDI r2, 204
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
