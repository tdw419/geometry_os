; DESCRIPTION: Renders a black line between points (509, 167) and (86, 139).
; PLAN: r0=509(x1), r1=167(y1), r2=86(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 167
LDI r2, 86
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
