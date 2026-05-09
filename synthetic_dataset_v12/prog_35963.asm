; DESCRIPTION: Renders a red line between points (395, 0) and (203, 193).
; PLAN: r0=395(x1), r1=0(y1), r2=203(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 0
LDI r2, 203
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
