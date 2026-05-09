; DESCRIPTION: Renders a red line between points (280, 130) and (223, 97).
; PLAN: r0=280(x1), r1=130(y1), r2=223(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 130
LDI r2, 223
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
