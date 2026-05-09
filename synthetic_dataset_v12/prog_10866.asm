; DESCRIPTION: Draws a white line from (348, 220) to (253, 71).
; PLAN: r0=348(x1), r1=220(y1), r2=253(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 220
LDI r2, 253
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
