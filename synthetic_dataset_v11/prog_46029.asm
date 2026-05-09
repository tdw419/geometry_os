; DESCRIPTION: Renders a white line between points (204, 39) and (86, 100).
; PLAN: r0=204(x1), r1=39(y1), r2=86(x2), r3=100(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 39
LDI r2, 86
LDI r3, 100
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
