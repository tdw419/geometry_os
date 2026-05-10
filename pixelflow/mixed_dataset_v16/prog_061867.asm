; DESCRIPTION: Renders a green line segment connecting (348, 187) to (382, 135).
; PLAN: r0=348(x1), r1=187(y1), r2=382(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 187
LDI r2, 382
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
