; DESCRIPTION: Renders a black line between points (140, 8) and (67, 139).
; PLAN: r0=140(x1), r1=8(y1), r2=67(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 8
LDI r2, 67
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
