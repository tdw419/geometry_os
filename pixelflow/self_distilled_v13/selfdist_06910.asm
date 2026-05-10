; DESCRIPTION: Renders a yellow line segment connecting (348, 154) to (386, 80).
; PLAN: r0=348(x1), r1=154(y1), r2=386(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 154
LDI r2, 386
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
