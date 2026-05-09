; DESCRIPTION: Renders a purple line between points (174, 151) and (18, 62).
; PLAN: r0=174(x1), r1=151(y1), r2=18(x2), r3=62(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 151
LDI r2, 18
LDI r3, 62
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
