; DESCRIPTION: Renders a red line segment connecting (89, 130) to (189, 168).
; PLAN: r0=89(x1), r1=130(y1), r2=189(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 130
LDI r2, 189
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
