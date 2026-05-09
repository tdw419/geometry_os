; DESCRIPTION: Renders a black line between points (195, 54) and (348, 242).
; PLAN: r0=195(x1), r1=54(y1), r2=348(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 54
LDI r2, 348
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
