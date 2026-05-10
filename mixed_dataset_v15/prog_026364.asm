; DESCRIPTION: Renders a green line between points (237, 79) and (348, 65).
; PLAN: r0=237(x1), r1=79(y1), r2=348(x2), r3=65(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 79
LDI r2, 348
LDI r3, 65
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
