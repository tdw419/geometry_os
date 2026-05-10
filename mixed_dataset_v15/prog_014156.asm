; DESCRIPTION: Renders a white line segment connecting (384, 130) to (273, 75).
; PLAN: r0=384(x1), r1=130(y1), r2=273(x2), r3=75(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 130
LDI r2, 273
LDI r3, 75
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
