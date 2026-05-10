; DESCRIPTION: Renders a white line between points (136, 130) and (167, 15).
; PLAN: r0=136(x1), r1=130(y1), r2=167(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 130
LDI r2, 167
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
