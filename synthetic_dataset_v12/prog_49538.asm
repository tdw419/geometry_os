; DESCRIPTION: Renders a black line between points (348, 211) and (433, 134).
; PLAN: r0=348(x1), r1=211(y1), r2=433(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 211
LDI r2, 433
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
