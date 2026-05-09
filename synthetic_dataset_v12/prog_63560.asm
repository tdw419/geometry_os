; DESCRIPTION: Renders a yellow line between points (348, 57) and (400, 108).
; PLAN: r0=348(x1), r1=57(y1), r2=400(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 57
LDI r2, 400
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
