; DESCRIPTION: Renders a green line between points (435, 122) and (348, 49).
; PLAN: r0=435(x1), r1=122(y1), r2=348(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 122
LDI r2, 348
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
