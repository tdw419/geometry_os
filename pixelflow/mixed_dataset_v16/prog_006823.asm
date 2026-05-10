; DESCRIPTION: Renders a white line segment connecting (348, 70) to (177, 126).
; PLAN: r0=348(x1), r1=70(y1), r2=177(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 70
LDI r2, 177
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
