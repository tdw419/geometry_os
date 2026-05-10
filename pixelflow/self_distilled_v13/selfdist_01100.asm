; DESCRIPTION: Renders a red line segment connecting (80, 130) to (350, 144).
; PLAN: r0=80(x1), r1=130(y1), r2=350(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 130
LDI r2, 350
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
