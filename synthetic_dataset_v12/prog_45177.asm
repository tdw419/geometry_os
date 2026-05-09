; DESCRIPTION: Renders a cyan line between points (251, 53) and (119, 78).
; PLAN: r0=251(x1), r1=53(y1), r2=119(x2), r3=78(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 53
LDI r2, 119
LDI r3, 78
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
