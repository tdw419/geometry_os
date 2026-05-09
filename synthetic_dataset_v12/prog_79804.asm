; DESCRIPTION: Renders a red line between points (288, 172) and (491, 224).
; PLAN: r0=288(x1), r1=172(y1), r2=491(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 172
LDI r2, 491
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
