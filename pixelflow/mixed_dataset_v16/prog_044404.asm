; DESCRIPTION: Renders a yellow line between points (213, 139) and (0, 31).
; PLAN: r0=213(x1), r1=139(y1), r2=0(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 139
LDI r2, 0
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
