; DESCRIPTION: Renders a white line between points (243, 179) and (348, 25).
; PLAN: r0=243(x1), r1=179(y1), r2=348(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 179
LDI r2, 348
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
