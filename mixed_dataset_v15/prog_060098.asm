; DESCRIPTION: Renders a white line between points (52, 211) and (348, 117).
; PLAN: r0=52(x1), r1=211(y1), r2=348(x2), r3=117(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 211
LDI r2, 348
LDI r3, 117
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
