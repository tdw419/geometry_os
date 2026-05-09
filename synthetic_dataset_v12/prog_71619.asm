; DESCRIPTION: Renders a yellow line between points (310, 221) and (348, 232).
; PLAN: r0=310(x1), r1=221(y1), r2=348(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 221
LDI r2, 348
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
