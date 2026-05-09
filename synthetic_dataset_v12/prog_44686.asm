; DESCRIPTION: Renders a red line between points (189, 35) and (28, 17).
; PLAN: r0=189(x1), r1=35(y1), r2=28(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 35
LDI r2, 28
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
