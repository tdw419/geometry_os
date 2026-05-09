; DESCRIPTION: Renders a white line between points (274, 56) and (28, 1).
; PLAN: r0=274(x1), r1=56(y1), r2=28(x2), r3=1(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 56
LDI r2, 28
LDI r3, 1
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
