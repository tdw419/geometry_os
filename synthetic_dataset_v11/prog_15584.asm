; DESCRIPTION: Renders a black line between points (28, 124) and (129, 53).
; PLAN: r0=28(x1), r1=124(y1), r2=129(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 124
LDI r2, 129
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
