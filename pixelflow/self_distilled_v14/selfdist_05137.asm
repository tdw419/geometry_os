; DESCRIPTION: Renders a yellow line segment connecting (348, 59) to (360, 44).
; PLAN: r0=348(x1), r1=59(y1), r2=360(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 59
LDI r2, 360
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
