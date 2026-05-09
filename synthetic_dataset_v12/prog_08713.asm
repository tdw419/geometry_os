; DESCRIPTION: Renders a green line between points (454, 111) and (471, 88).
; PLAN: r0=454(x1), r1=111(y1), r2=471(x2), r3=88(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 111
LDI r2, 471
LDI r3, 88
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
