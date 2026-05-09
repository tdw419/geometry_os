; DESCRIPTION: Renders a red line between points (194, 170) and (27, 138).
; PLAN: r0=194(x1), r1=170(y1), r2=27(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 170
LDI r2, 27
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
