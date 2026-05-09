; DESCRIPTION: Renders a purple line between points (53, 151) and (23, 31).
; PLAN: r0=53(x1), r1=151(y1), r2=23(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 151
LDI r2, 23
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
