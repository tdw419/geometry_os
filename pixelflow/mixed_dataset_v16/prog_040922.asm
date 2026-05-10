; DESCRIPTION: Renders a red line between points (414, 35) and (28, 56).
; PLAN: r0=414(x1), r1=35(y1), r2=28(x2), r3=56(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 35
LDI r2, 28
LDI r3, 56
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
