; DESCRIPTION: Renders a white line between points (190, 135) and (67, 129).
; PLAN: r0=190(x1), r1=135(y1), r2=67(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 135
LDI r2, 67
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
