; DESCRIPTION: Renders a white line between points (67, 167) and (191, 183).
; PLAN: r0=67(x1), r1=167(y1), r2=191(x2), r3=183(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 167
LDI r2, 191
LDI r3, 183
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
