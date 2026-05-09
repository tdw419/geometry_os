; DESCRIPTION: Renders a white line between points (67, 130) and (348, 102).
; PLAN: r0=67(x1), r1=130(y1), r2=348(x2), r3=102(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 130
LDI r2, 348
LDI r3, 102
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
