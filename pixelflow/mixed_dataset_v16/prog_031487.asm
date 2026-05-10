; DESCRIPTION: Renders a black line between points (328, 154) and (348, 176).
; PLAN: r0=328(x1), r1=154(y1), r2=348(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 154
LDI r2, 348
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
