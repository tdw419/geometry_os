; DESCRIPTION: Renders a cyan line between points (36, 139) and (47, 186).
; PLAN: r0=36(x1), r1=139(y1), r2=47(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 139
LDI r2, 47
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
