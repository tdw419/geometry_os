; DESCRIPTION: Renders a green line between points (336, 179) and (36, 139).
; PLAN: r0=336(x1), r1=179(y1), r2=36(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 179
LDI r2, 36
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
