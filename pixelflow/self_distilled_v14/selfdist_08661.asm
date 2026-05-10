; DESCRIPTION: Renders a yellow line segment connecting (348, 152) to (265, 140).
; PLAN: r0=348(x1), r1=152(y1), r2=265(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 152
LDI r2, 265
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
