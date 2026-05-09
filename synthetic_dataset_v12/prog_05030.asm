; DESCRIPTION: Renders a red line between points (496, 130) and (189, 113).
; PLAN: r0=496(x1), r1=130(y1), r2=189(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 130
LDI r2, 189
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
